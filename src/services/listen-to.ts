import { Prisma } from "@prisma/client"
import prisma from "../data-access/db.server"
import { cp } from "fs"
import { getGenreByGenreId, getMusicByMusicId } from "../client/PHPClient"

export interface ICreateListenTo {
  idUser: number
  idArtist: number
  idMusic: number
  idAlbum: number
  idGenre: number
}
export const createListenTo = async (listenTo: ICreateListenTo) => {
  const insertListenTo = await prisma.listenTo.create({
    data: listenTo,
  })
  return insertListenTo
}

export async function getTopMusicByListener(idArtist: number) {
  try {
    const oneYearAgo: Date = new Date()
    oneYearAgo.setMonth(oneYearAgo.getMonth() - 12)

    const topMusicByListener = await prisma.listenTo.groupBy({
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
      take: 5,
    })

    const results = []

    for (const song of topMusicByListener) {
      const idMusic = song.idMusic
      const listenerStats: { month; count }[] = await prisma.$queryRaw`
        SELECT COUNT(id)::INT as count, date_trunc('month', "listenAt") as month 
        FROM "ListenTo" 
        WHERE "listenAt" > ${oneYearAgo} and "idArtist" = ${idArtist} and "idMusic" = ${idMusic}
        GROUP BY month;
      `

      const formattedListenerStats = listenerStats.map((stat) => ({
        month: stat.month,
        count: stat.count,
      }))
      const { success, data } = await getMusicByMusicId(idMusic)
      if (!success) {
        throw new Error("Error occured while gathering data!")
      }
      results.push({
        id: idMusic,
        title: data.title,
        likedCount: song._count.id,
        listener: formattedListenerStats,
      })
    }

    return results
  } catch (error) {
    console.error("Error:", error)
    throw error // Rethrow the error to be handled by the caller
  } finally {
    await prisma.$disconnect()
  }
}

export async function getAllGenreStats() {
  try {
    const oneYearAgo: Date = new Date()
    oneYearAgo.setMonth(oneYearAgo.getMonth() - 12)

    const topGenreByListener = await prisma.listenTo.groupBy({
      by: ["idGenre"],
      where: {
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
    })

    const genreStats = []
    for (const genre of topGenreByListener) {
      const idGenre = genre.idGenre
      const listenerCount = genre._count.id

      const { success, data } = await getGenreByGenreId(idGenre)
      if (!success) {
        throw new Error("Error occured while gathering data!")
      }
      genreStats.push({
        id: idGenre,
        genre: data.name,
        listenerCount,
      })
    }

    return genreStats
  } catch (error) {
    console.error("Error:", error)
    throw error
  } finally {
    await prisma.$disconnect()
  }
}
