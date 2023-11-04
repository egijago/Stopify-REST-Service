import jwt, { JwtPayload } from "jsonwebtoken";
import {NextFunction, Request,Response} from "express";

export interface CustomRequest extends Request {
    token: string | JwtPayload;
}

export const auth = (req:Request,res:Response,next:NextFunction)=>{
    const authHeader = req.headers['authorization'];
    const token =authHeader && authHeader.split(' ')[1];

    if(!token){
        return res.sendStatus(401).send({error:"Token not found"});
    }
    const decoded = jwt.verify(token,process.env.ACCESS_TOKEN as string);
    (req as CustomRequest).token = decoded;
    next();
}