import  Item  from "../../models/sequelize/Item.model";
import ItemStorageInterface from "../inteface/Item.interface";
import Main from "./Main";


export default class ItemStorage implements ItemStorageInterface {

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