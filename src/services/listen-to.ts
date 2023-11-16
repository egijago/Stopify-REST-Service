import { Prisma } from "@prisma/client"
import prisma from "../data-access/db.server"

export interface ICreateListenTo {
  idUser: number
  idArtist: number
  idMusic: number
  idAlbum: number
}
export const createListenTo = async (listenTo: ICreateListenTo) => {
  const insertListenTo = await prisma.listenTo.create({
    data: listenTo,
  })
  return insertListenTo
}

export interface MusicListen {
  idMusic: number
  _count: {
    listenAt: number
  }
}
export interface AlbumListen {
  idAlbum: number
  _count: {
    listenAt: number
  }
}
export const highestListenByMusic = async (
  idArtist: number,
): Promise<MusicListen[]> => {
  const low: Date = new Date()
  low.setMonth(low.getMonth() - 12)
  const highestListen = await prisma.listenTo.groupBy({
    by: ["idMusic"],
    where: {
      idArtist: idArtist,
      listenAt: {
        gt: low
      },
    },
    _count: {
      listenAt: true,
    },
    orderBy: {
      _count: {
        listenAt: "desc",
      },
    },
    take: 5,
  })
  
  // console.log(JSON.stringify())
  return highestListen
}

export const highestListenByAlbum = async (
  idArtist: number,
): Promise<AlbumListen[]> => {
  const low: Date = new Date()
  low.setMonth(low.getMonth() - 12)
  const highestListen = await prisma.listenTo.groupBy({
    by: ['idAlbum'],
    where: {
      idArtist: idArtist,
      listenAt: {
        gt: low
      }
    },
    _count: {
      listenAt: true,
    },
    orderBy: {
      _count: {
        listenAt: "desc",
      },
    },
    take: 5,
  })

  console.log(highestListen)

  return highestListen
}
