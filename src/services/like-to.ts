import { Prisma } from "@prisma/client"
import prisma from "../data-access/db.server"
import { ConflictError } from "../errors/ConflictError"
import { NotFoundError } from "../errors/NotFoundError"
import { getMusicByMusicId } from "../client/PHPClient"

export interface MusicLike {
  idMusic: number
  _count: {
    idUser: number
  }
}
export interface AlbumLike {
  idAlbum: number
  _count: {
    idUser: number
  }
}

export interface ICreateLikeTo {
  idUser: number
  idMusic: number
  idAlbum: number
  idArtist: number
  idGenre: number
}
export const createLikeTo = async (likeTo: ICreateLikeTo) => {
  try {
    const insertLikeTo = await prisma.likeTo.create({
      data: likeTo,
    })
    return insertLikeTo
  } catch (error) {
    if (
      error instanceof Prisma.PrismaClientKnownRequestError &&
      error.code === "P2002"
    ) {
      throw new ConflictError("User has already like song")
    }
  }
}

export interface IDeleteLikeTo {
  idUser: number
  idMusic: number
}
export const deleteLikeTo = async ({ idUser, idMusic }: IDeleteLikeTo) => {
  try {
    const deleteLikeTo = await prisma.likeTo.delete({
      where: {
        idUser_idMusic: {
          idUser,
          idMusic,
        },
      },
    })
    return deleteLikeTo
  } catch (error) {
    if (
      error instanceof Prisma.PrismaClientKnownRequestError &&
      error.code === "P2002"
    ) {
      throw new NotFoundError("Like record doesnt exist!")
    }
  }
}

export async function getTopMusicByLiked(idArtist: number) {
  try {
    const oneYearAgo: Date = new Date()
    oneYearAgo.setMonth(oneYearAgo.getMonth() - 12)
    const result = await prisma.listenTo.groupBy({
      by: ["idMusic"],
      where: {
        idArtist,
        listenAt: {
          gte: oneYearAgo,
        },
      },
      _count: {
        id: true,
      },
      orderBy: {
        _count: {
          id: "desc",
        },
      },
      take: 10,
    })

    const completeResult = []
    for (let i = 0; i < result.length; i++) {
      const { success, data } = await getMusicByMusicId(result[i].idMusic)
      if (!success) {
        throw new Error("Error while gathering information")
      }
      completeResult.push({
        id: result[i].idMusic,
        title: data.title,
        count: result[i]._count,
      })
    }
    return completeResult
  } catch (error) {
    console.error("Error:", error)
  } finally {
    await prisma.$disconnect()
  }
}

export async function getTopAlbumByLiked(idArtist: number) {
  try {
    const oneYearAgo: Date = new Date()
    oneYearAgo.setMonth(oneYearAgo.getMonth() - 12)
    const result = await prisma.listenTo.groupBy({
      by: ["idAlbum"],
      where: {
        idArtist,
        listenAt: {
          gte: oneYearAgo,
        },
      },
      _count: {
        id: true,
      },
      orderBy: {
        _count: {
          id: "desc",
        },
      },
      take: 10,
    })

    return result
  } catch (error) {
    console.error("Error:", error)
  } finally {
    await prisma.$disconnect()
  }
}
