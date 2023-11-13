import { Request, Response } from "express"
import jwt from "jsonwebtoken"
import * as ListenToService from "./../services/listen-to"

export const highestListenByMusic = async (req: Request, res: Response) => {
  const api_key = req.headers.authorization
  if (!api_key || api_key !== process.env.REST_API_KEY) {
    return res.status(400).send({ error: "Unauthorized" })
  }
  try {
    const decoded = jwt.verify(
      req.cookies["token"],
      process.env.ACCESS_TOKEN as string,
    ) as jwt.JwtPayload
    const idArtist = decoded.id
    const highestListen = ListenToService.highestListenByMusic(idArtist)
    console.log(highestListen)
    return res.status(200).send({ data: highestListen })
  } catch (error) {
    return res.status(500).send({ error: "Internal Server Error" })
  }
}

export const highestListenByAlbum = async (req: Request, res: Response) => {
  const api_key = req.headers.authorization
  if (!api_key || api_key !== process.env.REST_API_KEY) {
    return res.status(400).send({ error: "Unauthorized" })
  }
  try {
    const decoded = jwt.verify(
      req.cookies["token"],
      process.env.ACCESS_TOKEN as string,
    ) as jwt.JwtPayload
    const idArtist = decoded.id
    const highestListen = ListenToService.highestListenByAlbum(idArtist)
    console.log(highestListen)
    return res.status(200).send({ data: highestListen })
  } catch (error) {
    return res.status(500).send({ error: "Internal Server Error" })
  }
}

export const listenTo = async (req: Request, res: Response) => {
  const {
    idUser,
    idArtist,
    idMusic,
    idAlbum
  }: ListenToService.ICreateListenTo = req.body
  if (!idUser || !idArtist || !idMusic || !idAlbum) {
    return res.status(400).send({ error: "Please fill all the fields" })
  }
  const api_key = req.headers.authorization
  if (!api_key || api_key !== process.env.REST_API_KEY) {
    return res.status(400).send({ error: "Unauthorized" })
  }
  try {
    const listenTo = ListenToService.createListenTo({
      idUser,
      idArtist,
      idMusic,
      idAlbum
    })
    console.log(listenTo)
    return res.status(200).send({ message: "aman bang" })
  } catch (error) {
    return res.status(500).send({ error: "Internal Server Error" })
  }
}
