import express from "express";
import {
  customErrorMiddleware,
  errorMiddlleware,
  getLogErrorMiddleware,
} from "bokchalhandler";
import cors from "cors";
import * as dotenv from "dotenv";

import logger from "./src/config/logger";
import { routerApiV1 } from "./src/routes/index";
import corsOptions from "./src/config/corsConfig";
import { validateTokenMiddleware } from "./src/middleware/validateToken.middleware";

dotenv.config();
const port = 3000;
const app = express();

console.log = (...args) => logger.info(args.join(' '));
console.error = (...args) => logger.error(args.join(' '));
console.warn = (...args) => logger.warn(args.join(' '));
console.info = (...args) => logger.info(args.join(' '));
console.debug = (...args) => logger.debug(args.join(' '));

app.use(cors(corsOptions));
app.use(validateTokenMiddleware);
app.use(express.json());

// Registrar todas las solicitudes
app.use((req, res, next) => {
  logger.info(`${req.method} ${req.url}`);
  next();
});

routerApiV1(app);
app.use(getLogErrorMiddleware);
app.use(customErrorMiddleware);
app.use(errorMiddlleware);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
