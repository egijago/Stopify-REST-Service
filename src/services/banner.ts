import prisma from "../data-access/db.server"
import { Banner } from "@prisma/client"

export interface ICreateBanner {
  imageUrl: string
  description: string
  startDate: Date
  endDate: Date
  idArtist: number
}
export const createBanner = async (banner: ICreateBanner) => {
  const insertedBanner = prisma.banner.create({
    data: banner,
  })
  return insertedBanner
}
