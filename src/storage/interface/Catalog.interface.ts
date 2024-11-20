
export default interface CatalogStorageInterface {
    getCatalogs(): Promise<any>;
    getItemsByCatalogId(catalogId: number): Promise<any>;
}