import prisma from "../data-access/db.server"

export interface ICreateListenTo {
    idUser: number;
    idArtist: number;
    idMusic: number;
    idAlbum: number;
}
export const createListenTo = async (listenTo: ICreateListenTo) => {
    try {
      const insertListenTo = await prisma.listenTo.create({
        data: listenTo,
      })
      return insertListenTo
    } catch (error) {
      return null
    }
}

interface MusicListen {
  idMusic: number;
  _count: {
      listenAt: number;
  };
}
interface AlbumListen {
  idAlbum: number;
  _count: {
      listenAt: number;
  };
}

export const highestListenByMusic = async (idArtist: number): Promise<MusicListen[]> => {
  const highestListen = await prisma.listenTo.groupBy({
      by: ['idMusic'],
      where: {
          idArtist: idArtist,
      },
      _count: {
          listenAt: true,
      },
      orderBy: {
          _count: {
              listenAt: 'desc',
          },
      },
      take: 5,
  });

  return highestListen;
};

export const highestListenByAlbum = async (idArtist: number): Promise<AlbumListen[]> => {
  const highestListen = await prisma.listenTo.groupBy({
    by: ['idAlbum'],
    where: {
        idArtist: idArtist,
    },
    _count: {
        listenAt: true,
    },
    orderBy: {
        _count: {
            listenAt: 'desc',
        },
    },
    take: 5,
  });

  return highestListen;
};