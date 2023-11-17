import { Request, Response } from "express"
import jwt from "jsonwebtoken"
import * as LikeToService from "./../services/like-to"

export const like = async (req: Request, res: Response) => {
  const {
    idUser,
    idArtist,
    idMusic,
    idAlbum,
    idGenre,
  }: LikeToService.ICreateLikeTo = req.body
  if (!idUser || !idMusic || !idAlbum || !idArtist || !idGenre) {
    return res.status(400).send({ error: "Please fill all the fields" })
  }
  try {
    const like = await LikeToService.createLikeTo({
      idUser,
      idArtist,
      idMusic,
      idAlbum,
      idGenre,
    })
    if (!like) {
      throw new Error()
    }

    return res.status(200).send({ message: "Liked successfuly", success: true })
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

export const unlike = async (req: Request, res: Response) => {
  const { idUser, idArtist, idMusic, idAlbum }: LikeToService.ICreateLikeTo =
    req.body
  if (!idUser || !idMusic || !idAlbum || !idArtist) {
    return res.status(400).send({ error: "Please fill all the fields" })
  }

  try {
    const like = await LikeToService.deleteLikeTo({
      idUser,
      idMusic,
    })
    if (!like) {
      throw new Error()
    }
    return res.status(200).send({ message: "Liked successfuly", success: true })
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

export const getTopMusicByLiked = async (req: Request, res: Response) => {
  try {
    const decoded = jwt.verify(
      req.cookies["token"],
      process.env.ACCESS_TOKEN as string,
    ) as jwt.JwtPayload
    const idArtist = decoded.id
    const topMusic = await LikeToService.getTopMusicByLiked(idArtist)
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

export const getTopAlbumByLiked = async (req: Request, res: Response) => {
  try {
    const decoded = jwt.verify(
      req.cookies["token"],
      process.env.ACCESS_TOKEN as string,
    ) as jwt.JwtPayload
    const idArtist = decoded.id
    const highestListen = LikeToService.getTopAlbumByLiked(idArtist)
    console.log(highestListen)
    return res.status(200).send({ data: highestListen })
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
