import * as BannerService from "./../services/banner"
import { Request, Response } from "express"
import { auth } from "../middleware/auth"
import { BadRequestError } from "../errors/BadRequestError"
import { HTTPRequestError } from "../errors/HTTPRequestError"
import * as fs from "fs"
import { JwtPayload } from "jsonwebtoken"
interface bannerRequest {
  image: File
  description: string
  startDate: Date
  endDate: Date
}

export const createBanner = async (req: Request, res: Response) => {
  try {
    if (!req.body.image) {
      console.log("req.body.image is missing")
    }

    const { image, description, startDate, endDate }: bannerRequest = req.body

    console.log(req.body)
    // Check if required fields are missing
    if (!description || !startDate || !endDate) {
      throw new BadRequestError("Missing required field!")
    }

    // Construct the URL for saving the image
    const url = `public/assets/${description}.png`

    const createdBanner = await BannerService.createBanner({
      imageUrl: url,
      description,
      startDate,
      endDate,
      idArtist: 1, // You might want to replace this with the actual artist ID
    })

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
