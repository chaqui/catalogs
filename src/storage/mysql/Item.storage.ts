import { CustomError } from "bokchalhandler/dist/CustomError";
import  Item  from "../../models/sequelize/Item.model";
import ItemStorageInterface from "../interface/Item.interface";
import Main from "./Main";


export default class ItemStorage implements ItemStorageInterface {
    getItemById(id: number): Promise<any> {
        const item = Item.findByPk(id);
        if(!item){
            throw CustomError.notDataFound("Item not found");
        }
        return item;
    }

    getItemsByIdItemProvider(idItemProvider: number, catalogId:number): Promise<any[]> {
       try {
            
            const item = Item.findAll({ where: { id: idItemProvider, catalogId} });
            if(!item){
                throw CustomError.notDataFound("Item not found");
            }
            const items = Item.findAll({ where: { itemId: idItemProvider,catalogId} });
            return items;
        } catch (error) {
            console.error("Error getting items by idItemProvider:", error);
            throw error;
        }
    }

    async getItems() {
        try {
            const items = await Item.findAll();
            return items;
        } catch (error) {
            console.error("Error getting items:", error);
            throw error;
        }
    }
}