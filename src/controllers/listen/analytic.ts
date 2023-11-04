import prisma from "../../utils/db.server";
import { Request,Response } from 'express';
import jwt from 'jsonwebtoken';

export const highestListenByMusic = async (req:Request, res:Response) => {
    const api_key = req.headers.authorization;
    if (!api_key || api_key !== process.env.REST_API_KEY) {
        return res.status(400).send({ error: 'Unauthorized' });
    }
    try {
        const decoded = jwt.verify(req.cookies['token'], process.env.ACCESS_TOKEN as string) as jwt.JwtPayload;
        const idArtist = decoded.id;
        const highestListen = await prisma.listenTo.groupBy({
            by: ['titleMusic'],
            where:{
                idArtist: idArtist
            },
            _count: {
                date: true,
            },
            orderBy: {
                _count: {
                    titleMusic: 'desc'
                }
            },
            take: 5
        });
        console.log(highestListen)
        return res.status(200).send({ "data":highestListen });
    } catch (error) {
        return res.status(500).send({ error: 'Internal Server Error' });
    }
}

export const highestListenByAlbum = async (req:Request, res:Response) => {
    const api_key = req.headers.authorization;
    if (!api_key || api_key !== process.env.REST_API_KEY) {
        return res.status(400).send({ error: 'Unauthorized' });
    }
    try {
        const decoded = jwt.verify(req.cookies['token'], process.env.ACCESS_TOKEN as string) as jwt.JwtPayload;
        const idArtist = decoded.id;
        const highestListen = await prisma.listenTo.groupBy({
            by: ['titleAlbum'],
            where:{
                idArtist: idArtist
            },
            _count: {
                date: true,
            },
            orderBy: {
                _count: {
                    titleMusic: 'desc'
                }
            },
            take: 5
        });
        console.log(highestListen)
        return res.status(200).send({ "data":highestListen });
    } catch (error) {
        return res.status(500).send({ error: 'Internal Server Error' });
    }
}

