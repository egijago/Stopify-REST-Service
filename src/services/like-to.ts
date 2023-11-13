import prisma from "../data-access/db.server"

interface MusicLike {
    idMusic: number;
    _count: {
        idUser: number;
    };
}
interface AlbumLike {
    idAlbum: number;
    _count: {
        idUser: number;
    };
}

export interface ICreateLikeTo {
    idUser: number;
    idMusic: number;
    idAlbum: number;
    idArtist: number;
}    
export const createLikeTo = async (likeTo: ICreateLikeTo) => {
  const insertLikeTo = prisma.likeTo.create({
    data: likeTo,  
  })  
  return insertLikeTo
}  

export const highestLikeByMusic = async (idArtist: number): Promise<MusicLike[]> => {
    const highestLikes = await prisma.likeTo.groupBy({
        by: ['idMusic'],
        where: {
            idArtist: idArtist,
        },
        _count: {
            idUser: true,
        },
        orderBy: {
            _count: {
                idUser: 'desc',
            },
        },
        take: 5,
    });

    return highestLikes;
};
  
export const highestLikeByAlbum = async (idArtist: number): Promise<AlbumLike[]> => {
    const highestLikes = await prisma.likeTo.groupBy({
        by: ['idAlbum'],
        where: {
            idArtist: idArtist,
        },
        _count: {
            idUser: true,
        },
        orderBy: {
            _count: {
                idUser: 'desc',
            },
        },
        take: 5,
    });
    return highestLikes;
};