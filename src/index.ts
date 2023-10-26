import * as dotenv from 'dotenv';
import express  from 'express';
import cors from 'cors';

dotenv.config();

if (!process.env.PORT) {
  process.exit(1);
}

const PORT: number = parseInt(process.env.PORT as string, 10);

const app = express();

app.use(cors());
app.use(express.json());

app.listen(PORT, () => {
  console.log(`Listening on  http://localhost:${PORT}`);
});

app.get('/', (req, res) => {
    res.send('Hello World!');
});

app.post('/add',(req,res)=>{
    const {num1,num2} = req.body;
    const sum = num1 + num2;
    res.send({sum});
})

