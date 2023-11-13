import { Request, Response } from "express"
import prisma from "../data-access/db.server"
import jwt from "jsonwebtoken"
import * as LikeToService from "./../services/like-to"


export const likeTo = async (req: Request, res: Response) => {
  const {
    idUser,
    idArtist,
    idMusic,
    idAlbum
  }: LikeToService.ICreateLikeTo = req.body
  if (!idUser || !idMusic || !idAlbum || !idArtist) {
    return res.status(400).send({ error: "Please fill all the fields" })
  }
  const api_key = req.headers.authorization
  if (!api_key || api_key !== process.env.REST_API_KEY) {
    return res.status(400).send({ error: "Unauthorized" })
  }
  try {
    const like = LikeToService.createLikeTo({
      idUser,
      idArtist,
      idMusic,
      idAlbum
    })
    console.log(like)
    return res.status(200).send({ message: "aman bang" })
  } catch (error) {
    return res.status(500).send({ error: "Internal Server Error" })
  }
}

export const highestLikeByMusic = async (req: Request, res: Response) => {
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
    const highestLike = await LikeToService.highestLikeByMusic(idArtist)
    console.log(highestLike)
    return res.status(200).send({ data: highestLike })
  } catch (error) {
    return res.status(500).send({ error: "Internal Server Error" })
  }
}

export const highestLikeByAlbum = async (req: Request, res: Response) => {
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
    const highestListen = LikeToService.highestLikeByAlbum(idArtist)
    console.log(highestListen)
    return res.status(200).send({ data: highestListen })
  } catch (error) {
    return res.status(500).send({ error: "Internal Server Error" })
  }
}

