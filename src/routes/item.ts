import express, { NextFunction, Request, Response } from "express";
import ItemStorage from "../storage/mysql/Item.storage";
import ItemService from "../services/Item";

const routerItem = express.Router();

const itemStorage = new ItemStorage();
const itemService = new ItemService(itemStorage);

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
    const items = await itemService.getItems();
    res.status(200).json(items);
  } catch (error) {
    next(error);
  }
});

export default routerItem;
