import { Prisma } from "@prisma/client"
import prisma from "../data-access/db.server"
import { ConflictError } from "../errors/ConflictError"

export interface ICreatePaymentInfo {
  email: string
  cardNumber: string
  cardOwner: string
  cardExpMonth: number
  cardExpYear: number
  cardCvc: number
}
export const createPaymentInfo = async (paymentinfo: ICreatePaymentInfo) => {
  try {
    const idArtist = await prisma.artist.findFirst({
      where: {
        email: paymentinfo.email,
      },
      select: {
        id: true,
      },
    })
    const insertedArtisted = await prisma.paymentInfo.create({
      data: {
        idArtist: idArtist.id,
        cardNumber: paymentinfo.cardNumber,
        cardOwner: paymentinfo.cardOwner,
        cardExpMonth: Number(paymentinfo.cardExpMonth),
        cardExpYear: Number(paymentinfo.cardExpYear),
        cardCvc: Number(paymentinfo.cardCvc),
      },
    })
    console.log(insertedArtisted)
    return insertedArtisted
  } catch (error) {
    if (
      error instanceof Prisma.PrismaClientKnownRequestError &&
      error.code === "P2002"
    ) {
      throw new ConflictError("Email has already been registered!")
    }
    console.log(error)
  }
}
