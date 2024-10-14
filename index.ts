import express from 'express';
import routerSystem  from './src/routes/system';
import { customErrorMiddleware, errorMiddlleware, getLogErrorMiddleware } from './src/errors/ExceptionMiddlewares';

const app = express();
const port = 3000;

app.use(express.json());
app.get('/', (req, res) => {
    res.send('Hello, world!');
});
app.use('/system', routerSystem);

app.use(getLogErrorMiddleware);
app.use(customErrorMiddleware);
app.use(errorMiddlleware);


app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});