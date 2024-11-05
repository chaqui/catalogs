import { CustomError } from "bokchalhandler/dist/CustomError";
import Catalog from "../../models/sequelize/Catalog.model";
import "./Main";
import CatalogStorageInterface from "../interface/Catalog.interface";

export default class CatalogStorage implements CatalogStorageInterface {
  

  async getCatalogs(): Promise<any> {
    try {
      const catalogs = await Catalog.findAll();
      return catalogs;
    } catch (error) {
      console.error("Error getting catalogs:", error);
      throw CustomError.notDataFound("Catalogs not found");
    }
  }

  async getItemsByCatalogId(catalogId: number): Promise<any> {
    try {
      const catalog = await Catalog.findByPk(catalogId);
      if (!catalog) {
        throw CustomError.notFound("Catalog not found");
      }
      const items = await catalog.items;

      return items;
    } catch (error) {
      console.error("Error getting items by catalogId:", error);
      throw error;
    }
  }
}
