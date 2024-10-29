import express, { NextFunction, Request, Response } from "express";

const routerItem = express.Router();

/**
 * Function to get all items from the item storage and return the items
 * in the response with status code 200 and 204 if no items are found
 *
 * @param req Request object
 * @param res Response object
 * @param next Function to call the next middleware
 * @returns nothing
 */
routerItem.get("/", async (req: Request, res: Response, next: NextFunction) => {
  try {
    res.status(200).send("Items");
  } catch (error) {
    next(error);
  }
});

export default routerItem;
