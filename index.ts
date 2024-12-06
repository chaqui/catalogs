import express from "express";
import {
  customErrorMiddleware,
  errorMiddlleware,
  getLogErrorMiddleware,
} from "bokchalhandler";
import cors from "cors";
import { routerApiV1 } from "./src/routes/index";

const app = express();
const port = 3000;

app.use(cors({
  origin: (origin, callback) => {
    if (origin && /^http:\/\/localhost:\d+$/.test(origin)) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS"));
    }
  }
}));

app.use(express.json());

routerApiV1(app);
app.use(getLogErrorMiddleware);
app.use(customErrorMiddleware);
app.use(errorMiddlleware);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
