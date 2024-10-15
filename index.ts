import express from "express";
import {
  customErrorMiddleware,
  errorMiddlleware,
  getLogErrorMiddleware,
} from "bokchalhandler";
import { routerApiV1 } from "./src/routes/index";

const app = express();
const port = 3000;

app.use(express.json());

app.get("/", (req, res) => {
  res.send("Hello, world!");
});

routerApiV1(app);

app.use(getLogErrorMiddleware);
app.use(customErrorMiddleware);
app.use(errorMiddlleware);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
