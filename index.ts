import express from "express";
import {
  customErrorMiddleware,
  errorMiddlleware,
  getLogErrorMiddleware,
} from "bokchalhandler";
import cors from "cors";
import * as dotenv from "dotenv";

import { routerApiV1 } from "./src/routes/index";
import corsOptions from "./src/config/corsConfig";
import { validateTokenMiddleware } from "./src/middleware/validateToken.middleware";

dotenv.config();
const port = 3000;
const app = express();

app.use(cors(corsOptions));
app.use(validateTokenMiddleware);
app.use(express.json());

routerApiV1(app);
app.use(getLogErrorMiddleware);
app.use(customErrorMiddleware);
app.use(errorMiddlleware);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
