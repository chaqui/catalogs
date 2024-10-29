import { CustomError } from "bokchalhandler/dist/CustomError";
import { Catalog } from "../../models/sql/Catalog.model";
import Main from "./Main";
import CatalogStorageInterface from "../inteface/Catalog.interface";

export default class CatalogStorage extends Main implements CatalogStorageInterface {
  constructor() {
    super();
  }

  async getCatalogs() {
    try {
      await this.connectToMariaDB();
      const catalogs = await Catalog.findAll();
      await this.closeMariaDBConnection();
      return catalogs;
    } catch (error) {
      console.error("Error getting catalogs:", error);
      throw CustomError.notDataFound("Catalogs not found");
    }
  }

  async getItemsByCatalogId(catalogId: number): Promise<any> {
    try {
      await this.connectToMariaDB();
      const catalog = await Catalog.findByPk(catalogId);
      if (!catalog) {
        throw CustomError.notFound("Catalog not found");
      }
      const items = await catalog.items;
      await this.closeMariaDBConnection();
      return items;
    } catch (error) {
      console.error("Error getting items by catalogId:", error);
      throw error;
    }
  }
}
