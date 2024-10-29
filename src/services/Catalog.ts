import CatalogStorageInterface from "../storage/inteface/Catalog.interface";


export class CatalogService {
    catalogStorage: CatalogStorageInterface;
    constructor(catalogStorage: CatalogStorageInterface) {
        this.catalogStorage = catalogStorage;
    }
    async getCatalogs() {
        return await this.catalogStorage.getCatalogs();
    }
    async getItemsByCatalogId(catalogId: number) {
        return await this.catalogStorage.getItemsByCatalogId(catalogId);
    }
}