import { Request, Response } from "express"
import jwt from "jsonwebtoken"
import * as ListenToService from "./../services/listen-to"

export const getTopMusicByListener = async (req: Request, res: Response) => {
  try {
    const token = req.cookies.token
    console.log(token)
    const decoded = jwt.verify(
      token,
      process.env.ACCESS_TOKEN as string,
    ) as jwt.JwtPayload
    const idArtist = decoded.id
    const topMusic = await ListenToService.getTopMusicByListener(idArtist)
    return res.status(200).send({ data: topMusic, success: true })
  } catch (error) {
    console.error(error)
    return res
      .status(500)
      .send({ success: false, message: "Internal Server Error" })
  }
}

export const listenTo = async (req: Request, res: Response) => {
  const {
    idUser,
    idArtist,
    idMusic,
    idAlbum,
    idGenre,
  }: ListenToService.ICreateListenTo = req.body
  if (!idUser || !idArtist || !idMusic || !idAlbum) {
    return res.status(400).send({ error: "Please fill all the fields" })
  }
  const api_key = req.headers.authorization
  if (!api_key || api_key !== process.env.REST_API_KEY) {
    return res.status(400).send({ error: "Unauthorized" })
  }
  try {
    const listenTo = await ListenToService.createListenTo({
      idUser,
      idArtist,
      idMusic,
      idAlbum,
      idGenre,
    })
    if (!listenTo) {
      return res.status(400).send({ error: "Bad Request" })
    }
    console.log(listenTo)
    return res
      .status(200)
      .send({ success: true, message: "Music liked successfully" })
  } catch (error) {
    return res
      .status(500)
      .send({ success: false, error: "Internal Server Error" })
  }
}

export const getTopGenreByListener = async (req: Request, res: Response) => {
  try {
    const decoded = jwt.verify(
      req.cookies["token"],
      process.env.ACCESS_TOKEN as string,
    ) as jwt.JwtPayload
    const idArtist = decoded.id
    const topMusic = await ListenToService.getTopMusicByListener(idArtist)
    return res.status(200).send({ data: topMusic, success: true })
  } catch (error) {
    if (!error.statusCode) {
      return res
        .status(500)
        .send({ success: false, message: "Internal Server Error" })
    }
    return res
      .status(error.statusCode)
      .send({ success: false, message: error.message })
  }
}
