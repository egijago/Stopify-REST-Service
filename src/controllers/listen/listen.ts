import { Request, Response } from 'express';
import prisma from '../../utils/db.server';
export const listenTo = async (req:Request, res:Response) => {
    const {idUser, idArtist} = req.body;
    const api_key = req.headers.authorization;
    if (!api_key || api_key !== process.env.REST_API_KEY) {
        return res.status(400).send({ error: 'Unauthorized' });
    }
    try {
        const like = await prisma.listenTo.create({
            data: {
                idUser: idUser,
                idArtist: idArtist,
            }
        });
        console.log(like)
        return res.status(200).send({ "message":"aman bang" });
    } catch (error) {
        return res.status(500).send({ error: 'Internal Server Error' });
    }
}