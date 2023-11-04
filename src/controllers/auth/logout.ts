import { Request, Response } from 'express';

export const logout = async (req:Request, res:Response) => {
    res.clearCookie('token').send({ message: 'Logged out successfully' });
}