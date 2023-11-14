import { Prisma } from "@prisma/client";
import prisma from "../data-access/db.server"
import { ConflictError } from "../errors/ConflictError";

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
    try {
        const insertLikeTo = await prisma.likeTo.create({
            data: likeTo,  
        })  
        return insertLikeTo
    } catch (error) {
        if (error instanceof Prisma.PrismaClientKnownRequestError && error.code === 'P2002') {
            throw new ConflictError("User has already like song")
        }
    }
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