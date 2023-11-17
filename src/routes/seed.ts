import { PrismaClient } from "@prisma/client"
import { faker } from "@faker-js/faker"

const prisma = new PrismaClient()

export async function reset() {
  prisma.artist.deleteMany()
  prisma.banner.deleteMany()
  prisma.likeTo.deleteMany()
  prisma.listenTo.deleteMany()
  prisma.paymentInfo.deleteMany()
}

export async function seedPrisma() {
  try {
    // seed artist
    for (let i = 0; i < 10; i++) {
      const seed_artist = await prisma.artist.create({
        data: {
          name: faker.internet.userName(),
          email: faker.internet.userName(),
          password: faker.internet.userName(),
        },
      })
      console.log(seed_artist)
    }

    const min_id_artist = (await prisma.artist.findFirst({
      select: {
        id: true,
      },
      orderBy: {
        id: "asc",
      },
    })) as any

    // seed paymentinfo
    const max_id_artist = (await prisma.artist.findFirst({
      select: {
        id: true,
      },
      orderBy: {
        id: "desc",
      },
    })) as any
    for (let i = min_id_artist; i < max_id_artist; i++) {
      const artist = (await prisma.artist.findFirst({
        where: {
          id: i,
        },
      })) as any
      if (artist) {
        const seed_album = await prisma.paymentInfo.create({
          data: {
            idArtist: i,
            cardOwner: faker.internet.userName(),
            cardNumber: faker.string.alpha(),
            cardExpMonth: faker.number.int({ min: 1, max: 12 }),
            cardExpYear: faker.number.int({ min: 1000, max: 2050 }),
            cardCvc: faker.number.int({ min: 1, max: 12 }),
          },
        })
        console.log(seed_album)
      }
    }

    // listen to

    //find all artist
    const all_artist = (await prisma.artist.findMany({
      select: {
        id: true,
      },
    })) as any
    for (let i = 0; i < 1000; i++) {
      const seed_listenTo = await prisma.listenTo.create({
        data: {
          idUser: faker.number.int({ min: 1, max: 20 }),
          idArtist:
            all_artist[Math.floor(Math.random() * all_artist.length)].id,
          idMusic: faker.number.int({ min: 1, max: 100 }),
          idAlbum: faker.number.int({ min: 1, max: 10 }),
          listenAt: faker.date.between('2023-01-01', '2023-01-12'),
          idGenre: faker.number.int({ min: 1, max: 10 }),
        },
      })
      console.log(seed_listenTo)
    }

    // like to

    for (let i = 0; i < 1000; i++) {
      const uniqueIdUser = i % 10
      const uniqueIdMusic = Math.ceil(i / 10)

      const existingLikeTo = await prisma.likeTo.findFirst({
        where: {
          idUser: uniqueIdUser,
          idMusic: uniqueIdMusic,
        },
      })

      if (!existingLikeTo) {
        const seed_likeTo = await prisma.likeTo.create({
          data: {
            idUser: uniqueIdUser,
            idArtist:
              all_artist[Math.floor(Math.random() * all_artist.length)].id,
            idMusic: uniqueIdMusic,
            idAlbum: faker.datatype.number({ min: 1, max: 10 }),
            idGenre: faker.number.int({ min: 1, max: 10 }),
          },
        })
        console.log(seed_likeTo)
      } else {
        // Handle the case where the entry already exists (optional)
        console.log(
          `Entry with idUser=${uniqueIdUser} and idMusic=${uniqueIdMusic} already exists.`,
        )
      }
    }

    console.log("Seed completed")
  } catch (error) {
    console.error("Error during seed:", error)
  } finally {
    await prisma.$disconnect()
  }
}
