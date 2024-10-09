import express from 'express';
import routerSystem  from './src/routes/system';
import { exceptionMiddleware, happyMiddleware } from './src/middlewares/ExceptionMiddlewares';
const app = express();
const port = 3000;

app.use(express.json());
app.get('/', (req, res) => {
    res.send('Hello, world!');
});
app.use('/system', routerSystem);

app.use(happyMiddleware);
app.use(exceptionMiddleware);


app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});