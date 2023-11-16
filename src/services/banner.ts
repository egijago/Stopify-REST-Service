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
  const insertedBanner = await prisma.banner.create({
    data: banner,
  })
  return insertedBanner
}

export const getBanner = async () => {
  const allBanner = await prisma.banner.findMany({
    select:{
      id:true,
      imageUrl:true
    },
    where:{
      endDate:{
        lte: new Date()
      }
    }
  })
  return allBanner
}