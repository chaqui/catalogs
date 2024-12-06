import { CustomError } from "bokchalhandler/dist/CustomError";
import CatalogStorageInterface from "../storage/interface/Catalog.interface";
import Item from "../models/sequelize/Item.model";
import ItemStorageInterface from "../storage/interface/Item.interface";


export class CatalogService {
    catalogStorage: CatalogStorageInterface;
    itemStorage: ItemStorageInterface;
    constructor(catalogStorage: CatalogStorageInterface, itemStorage: ItemStorageInterface) {
        this.catalogStorage = catalogStorage;
        this.itemStorage = itemStorage;
    }
    async getCatalogs(): Promise<any> {
        const catalogs = await this.catalogStorage.getCatalogs();
        if (!catalogs || catalogs.length === 0) {
            throw CustomError.notDataFound("Catalogs not found");
        }
        return catalogs;
    }
    async getItemsByCatalogId(catalogId: number) {
        const items = await this.catalogStorage.getItemsByCatalogId(catalogId);
        if (!items || items.length === 0) {
            throw CustomError.notDataFound("Items not found");
        }
        return items;
    }

    async getItemsByIdItemProvider(idItemProvider: number, idCatalog:number): Promise<Item[]> {
        const items = await this.itemStorage.getItemsByIdItemProvider(idItemProvider, idCatalog);
        if(!items || items.length === 0) {
            throw CustomError.notDataFound("Items not found");
        }
        return items;
    }
}