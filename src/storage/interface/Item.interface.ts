export default interface ItemStorageInterface {
    getItems(): Promise<any[]>;
    getItemsByIdItemProvider(idItemProvider: number, catalogId:number): Promise<any[]>;
    getItemById(id: number): Promise<any>;
    }