import bcrypt from 'bcrypt';
import prisma from '../../utils/db.server';
import { Request,Response } from 'express';

export const register = async (req:Request, res:Response) => {
    const {
        email,
        name,
        password,
        confPassword,
        cardNumber,
        cardName,
        cardExpMonth,
        cardExpYear,
        cardcvc,
      } = req.body;
      console.log(req.body)
    
      if (
        !email ||
        !name ||
        !password ||
        !confPassword || 
        !cardNumber ||
        !cardName ||
        !cardExpMonth ||
        !cardExpYear ||
        !cardcvc
      ) {
        return res.status(400).send({ error: 'Please fill all the fields' });
      }
    
      if (password !== confPassword) {
        return res.status(400).send({ error: 'Passwords do not match' });
      }
    
      try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);
        console.log(hashedPassword);
        const createUser = await prisma.artist.create({
            data: {
              email: email,
              password: hashedPassword,
              cardnumber: cardNumber,
              cardname: cardName,
              cardexpmonth: cardExpMonth,
              cardexpyear: cardExpYear,
              cardcvc: cardcvc,
              name: name,
            },
          });
          console.log(createUser);
          
          res.status(200).send({ message: 'User created successfully' });          
      } catch (error) {
        console.error(error);
        res.status(500).send({ error: 'Internal Server Error' });
      }
}