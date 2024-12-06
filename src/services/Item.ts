import { CustomError } from "bokchalhandler/dist/CustomError";
import ItemStorageInterface from "../storage/interface/Item.interface";
import Item from "../models/sequelize/Item.model";


export default class ItemService {

    constructor(private itemStorage: ItemStorageInterface) { }
    async getItems(): Promise<Item[]> {
        const items = await this.itemStorage.getItems();
        if(!items || items.length === 0) {
            throw CustomError.notDataFound("Items not found");
        }
        return items;
        
    }

    async getItemById(id: number): Promise<Item> {
        const item = await this.itemStorage.getItemById(id);
        if(!item){
            throw CustomError.notDataFound("Item not found");
        }
        return item;
    }
}


