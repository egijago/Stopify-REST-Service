import { IValidateLogin, createArtist } from "./../services/artist"
import jwt from "jsonwebtoken"
import { Request, Response } from "express"
import { validateLogin } from "../services/artist"
import { BadRequestError } from "../errors/BadRequestError"
import { HTTPRequestError } from "../errors/HTTPRequestError"
import { insertArtistPHP } from "../client/PHPClient"
import { createPaymentInfo } from "../services/payment-info"
export const login = async (req: Request, res: Response) => {
  try {
    const { email, password }: IValidateLogin = req.body
    const artist = await validateLogin({ email, password })

    if(!artist.success){
      return res.status(400).send({ success: false, message: artist.message })
    }
  
    const token = jwt.sign(
      { id: artist.data.id, email: artist.data.email, name: artist.data.name },
      process.env.ACCESS_TOKEN,
      { expiresIn: "2 days" },
    )

    console.log(token)
  
    res
      .cookie("token", token, {
        httpOnly: true,
        maxAge: 24 * 60 * 60 * 10,
      })
      .send({ message: "Login success!", success: true })
      .status(200)
  } catch (error) {
    console.log(error)
  }
}

export const logout = async (req: Request, res: Response) => {
  return res
    .clearCookie("token")
    .send({ message: "Logged out successfull!", success: true })
}

export const register = async (req: Request, res: Response) => {
  try {
    const { email, name, password, confPassword } = req.body
    const { cardNumber, cardOwner, cardExpMonth, cardExpYear, cardCvc} = req.body
    console.log("aman1   ",email)
    if (!email || !name || !password || !confPassword) {
      throw new BadRequestError("Please fill all the field!")
    }
    console.log("aman2")

    console.log(cardNumber, cardOwner, cardExpMonth, cardExpYear, cardCvc)

    if(!cardNumber || !cardOwner || !cardExpMonth || !cardExpYear || !cardCvc){
      throw new BadRequestError("Please fill all the field!")
    }

    console.log("aman3")

    if(cardNumber.length !== 16){
      throw new BadRequestError("Card number must be 16 digits!")
    }

    if(cardCvc.length !== 3){
      throw new BadRequestError("CVC must be 3 digits!")
    }

    if(cardExpMonth < 1 || cardExpMonth > 12){
      throw new BadRequestError("Card expiration month must be between 1 and 12!")
    }

    if(cardExpYear < new Date().getFullYear()){
      throw new BadRequestError("Card expiration year must be greater than Now!")
    }

    if (password !== confPassword) {
      throw new BadRequestError("Password does not match!")
    }

    const createdArtist = await createArtist({ email, name, password })

    const createPayment = await createPaymentInfo({email:email, cardNumber, cardOwner, cardExpMonth, cardExpYear, cardCvc})

    const createArtistPHP = await insertArtistPHP(email,name,"","true")

    if(!createdArtist ){
      throw new BadRequestError("User already exist!")
    }

    if(!createPayment){
      throw new BadRequestError("Payment failed!")
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