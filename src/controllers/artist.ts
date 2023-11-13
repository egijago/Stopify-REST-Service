import { IValidateLogin, createArtist } from "./../services/artist"
import bcrypt from "bcrypt"
import prisma from "../data-access/db.server"
import jwt from "jsonwebtoken"
import { Request, Response } from "express"
import { validateLogin } from "../services/artist"
import { create } from "domain"
import { BadRequestError } from "../errors/BadRequestError"
import { HTTPRequestError } from "../errors/HTTPRequestError"

export const login = async (req: Request, res: Response) => {
  const { email, password }: IValidateLogin = req.body
  const artist = await validateLogin({ email, password })

  const token = jwt.sign(
    { id: artist.id, email: artist.email, name: artist.name },
    process.env.ACCESS_TOKEN as string,
    { expiresIn: "2 days" },
  )

  res
    .cookie("token", token, {
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 10,
      secure: true,
    })
    .send({ message: "Login success!", success: true })
    .status(200)

  console.log(req.cookies)
}

export const logout = async (req: Request, res: Response) => {
  return res
    .clearCookie("token")
    .send({ message: "Logged out successfull!", success: true })
}

export const register = async (req: Request, res: Response) => {
  try {
    const { email, name, password, confPassword } = req.body
    if (!email || !name || !password || !confPassword) {
      console.log(email," + ", name, password, confPassword)
      throw new BadRequestError("Please fill all the field!")
    }

    if (password !== confPassword) {
      throw new BadRequestError("Password does not match!")
    }

    const createdArtist = await createArtist({ email, name, password })

    if (!createdArtist) {
      throw new Error()
    }

    res
      .status(200)
      .send({ success: true, message: "User created successfully" })
  } catch (error) {
    console.log(error.name)
    if (error instanceof HTTPRequestError) {
      console.log("foober")
      return res
        .status(error.statusCode)
        .send({ success: false, message: error.message })
    } else {
      console.log(error)
      res.status(500).send({ success: false, message: "Internal Server Error" })
    }
  }
}
