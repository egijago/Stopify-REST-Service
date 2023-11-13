import * as BannerService from "./../services/banner"
import { Request, Response } from "express"
import jwt, { JwtPayload } from "jsonwebtoken"
import prisma from "../data-access/db.server"
import { Banner, Prisma } from "@prisma/client"
import { auth } from "../middleware/auth"
import { BadRequestError } from "../errors/BadRequestError"
import { HTTPRequestError } from "../errors/HTTPRequestError"

export const createBanner = async (req: Request, res: Response) => {
  try {
    const decoded: JwtPayload = auth(req)
    const { idArtist } = decoded.id
    const {
      imageUrl,
      description,
      startDate,
      endDate,
    }: BannerService.ICreateBanner = req.body

    if (!imageUrl || !description || !startDate || !endDate) {
      throw new BadRequestError("Missing required field!")
    }

    const createdBanner = BannerService.createBanner({
      imageUrl,
      description,
      startDate,
      endDate,
      idArtist,
    })
    console.log(createdBanner)

    return res.status(201).json({ message: "Banner created successfully" })
  } catch (error) {
    if (error instanceof HTTPRequestError) {
      return res.status(error.statusCode).json({ message: "Invalid token" })
    }

    // Handle other errors
    console.error("Error creating poster:", error)
    return res.status(500).json({ error: "Internal Server Error" })
  }
}
