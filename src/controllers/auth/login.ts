import bcrypt from 'bcrypt';
import prisma from '../../utils/db.server';
import jwt from 'jsonwebtoken';
import { Request,Response } from 'express';

export const login = async (req:Request, res:Response) => {
    const {email,password} = req.body;
    const artist = await prisma.artist.findUnique({
      where: {
        email: email,
      }
    });
    if (!artist) {
      return res.status(400).send({ error: 'Invalid Credentials' });
    }
    const validPassword = await bcrypt.compare(password, artist.password);
    if (!validPassword) {
      return res.status(400).send({ error: 'Invalid Credentials' });
    }
    const token = jwt.sign({ id:artist.id,email:artist.email,name:artist.name }, process.env.ACCESS_TOKEN as string,{expiresIn:"2 days"});
    res.cookie('token', token, { httpOnly: true, maxAge:24*60*60*10}).send({ "message" : "login success" }).status(200);
    console.log(req.cookies)
}