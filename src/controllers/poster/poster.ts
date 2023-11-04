import { Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import prisma from '../../utils/db.server';

export const createPoster = async (req: Request, res: Response) => {
    try {
        // Check if the token is present in the request
        const token = req.cookies['token'];
        console.log("token",req.cookies['token'])
        if (!token) {
            return res.status(401).json({ error: 'Unauthorized' });
        }

        // Verify and decode the token
        const decoded = jwt.verify(token, process.env.ACCESS_TOKEN as string) as jwt.JwtPayload;
        const idArtist = decoded.id;

        // Extract data from the request body
        const { title, image, price, description, startDate, endDate } = req.body;

        // Validate request data (add your own validation logic as needed)
        if (!title || !image || !price || !description || !startDate || !endDate) {
            return res.status(400).json({ error: 'Bad Request. Missing required fields.' });
        }

        // Create a new poster using Prisma
        const createPoster = await prisma.poster.create({
            data: {
                idArtist: idArtist,
                title: title,
                image: image,
                price: price,
                description: description,
                startDate: startDate,
                endDate: endDate,
            }
        });

        // Log the created poster and send a success response
        console.log(createPoster);
        return res.status(201).json({ message: 'Poster created successfully' });
    } catch (error) {
        // Handle JWT verification errors
        if (error instanceof jwt.JsonWebTokenError) {
            return res.status(401).json({ error: 'Invalid token' });
        }

        // Handle other errors
        console.error('Error creating poster:', error);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};
