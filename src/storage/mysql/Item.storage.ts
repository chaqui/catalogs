import { Item } from "../../models/sequelize/Item.model";
import Main from "./Main";


export default class ItemStorage extends Main {
    constructor() {
        super();
    }

    async getItems() {
        try {
            await this.connectToMariaDB();
            const items = await Item.findAll();
            await this.closeMariaDBConnection();
            return items;
        } catch (error) {
            console.error("Error getting items:", error);
            throw error;
        }
    }
}