import { CustomError } from "bokchalhandler/dist/CustomError";
import CatalogStorageInterface from "../storage/inteface/Catalog.interface";


export class CatalogService {
    catalogStorage: CatalogStorageInterface;
    constructor(catalogStorage: CatalogStorageInterface) {
        this.catalogStorage = catalogStorage;
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
}