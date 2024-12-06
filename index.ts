import express from "express";
import {
  customErrorMiddleware,
  errorMiddlleware,
  getLogErrorMiddleware,
} from "bokchalhandler";
import cors from "cors";
import * as dotenv from "dotenv";

import { routerApiV1 } from "./src/routes/index";
import getCorsOptions from "./src/config/corsConfig";

dotenv.config();
const port = 3000;
const app = express();
const env = process.env.MODE_ENV || "development";
const corsOptions = getCorsOptions(env);


app.use(cors(corsOptions));
app.use(express.json());

routerApiV1(app);
app.use(getLogErrorMiddleware);
app.use(customErrorMiddleware);
app.use(errorMiddlleware);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
