import bcrypt from 'bcrypt';
import prisma from '../../utils/db.server';
import jwt from 'jsonwebtoken';
import { Request,Response } from 'express';

export const login = async (req:Request, res:Response) => {
    const {username,password} = req.body;
    const artist = await prisma.artist.findUnique({
      where: {
        email: username,
      },
    });
    if (!artist) {
      return res.status(400).send({ error: 'Invalid Credentials' });
    }
    const validPassword = await bcrypt.compare(password, artist.password);
    if (!validPassword) {
      return res.status(400).send({ error: 'Invalid Credentials' });
    }
    return res.status(200).send({ message: 'Login Success' });
}