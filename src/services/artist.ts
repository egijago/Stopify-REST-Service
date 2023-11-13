import bcrypt from "bcrypt"
import prisma from "../data-access/db.server"
import { Artist, Prisma } from "@prisma/client"
import { NotFoundError } from "../errors/NotFoundError"
import { UnauthorizedError } from "../errors/UnauthorizedError"
import { ConflictError } from "../errors/ConflictError"

export interface ICreateArtist {
  email: string
  name: string
  password: string
  active?: boolean
}
export const createArtist = async (artist: ICreateArtist) => {
  try { 
    const salt = await bcrypt.genSalt(10)
    artist.password = await bcrypt.hash(artist.password, salt)
      
    const insertedArtisted = await prisma.artist.create({
      data: artist,
    })
    return insertedArtisted
  } catch (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError && error.code === 'P2002') {
        throw new ConflictError("Email has already been registered!")
    }
  }

}

export interface IValidateLogin {
  email: string
  password: string
}
export const validateLogin = async ({ email, password }: IValidateLogin) => {
  const artist = await prisma.artist.findUnique({
    where: {
      email: email,
    },
  })

  if (!artist) {
    throw new NotFoundError("Email does not exist!")
  }

  const validPassword = await bcrypt.compare(password, artist.password)
  if (!validPassword) {
    throw new UnauthorizedError("Password does not match!")
  }

  return artist
}
