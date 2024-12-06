import express, { NextFunction, Request, Response } from "express";
import { CatalogService } from "../services/Catalog";
import CatalogStorage from "../storage/mysql/Catalog.storage";
import { CustomError } from "bokchalhandler/dist/CustomError";
import ItemStorage from "../storage/mysql/Item.storage";

const routerCatalog = express.Router();

const catalogService = new CatalogService(new CatalogStorage(), new ItemStorage());

/**
 * Function to get all catalogs from the catalog storage and return the catalogs
 * in the response with status code 200 and 204 if no catalogs are found
 *
 * @param req Request object
 * @param res Response object
 * @param next Function to call the next middleware
 * @returns nothing
 */
routerCatalog.get(
  "/",
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const catalogs = await catalogService.getCatalogs();
      if (catalogs.length === 0) {
        throw CustomError.notDataFound("No catalogs found");
      }
      res.status(200).send(catalogs);
    } catch (error) {
      next(error);
    }
  }
);

/**
 * Function to get all items by catalog id from the catalog storage and return the items
 * in the response with status code 200 and 204 if no items are found
 * @param req Request object
 * @param res Response object
 * @returns nothing
 */
routerCatalog.get(
  "/:id/items",
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const items = await catalogService.getItemsByCatalogId(
        Number(req.params.id)
      );
      if (items.length === 0) {
        throw CustomError.notDataFound("No items found");
      }
      res.status(200).send(items);
    } catch (error) {
      next(error);
    }
  }
);

routerCatalog.get(
  "/:id/items/:idItemProvider",
  async (req: Request, res: Response, next: NextFunction) => {
    try {
      const items = await catalogService.getItemsByIdItemProvider(
        Number(req.params.idItemProvider),
        Number(req.params.id)
      );
      if (items.length === 0) {
        throw CustomError.notDataFound("No items found");
      }
      res.status(200).send(items);
    } catch (error) {
      next(error);
    }
  }
);

export default routerCatalog;
