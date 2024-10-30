import { Sequelize } from "@sequelize/core";
import { MariaDbDialect } from "@sequelize/mariadb";
import * as dotenv from "dotenv";
import Catalog from "../../models/sql/Catalog.model";
import { Item } from "../../models/sql/Item.model";

export default class Main {
  sequelize: Sequelize;
  constructor() {
    dotenv.config();
    this.sequelize = new Sequelize({
      dialect: MariaDbDialect,
      host: process.env.MYSQL_HOST || "localhost",
      port: parseInt(process.env.MYSQL_PORT || "3306"),
      user: process.env.MYSQL_USER || "root",
      password: process.env.MYSQL_PASSWORD || "password",
      database: process.env.MYSQL_DATABASE || "catalogs",
      models: [Catalog, Item],
    });

    Catalog.initModel(this.sequelize);
    Item.initModel(this.sequelize);
  }

  protected async connectToMariaDB(): Promise<void> {
    try {
      await this.sequelize.authenticate();
      console.log("Connected to MariaDB");
    } catch (error) {
      console.error("Error connecting to MariaDB:", error);
      throw error;
    }
  }

  protected async closeMariaDBConnection(): Promise<void> {
    try {
      await this.sequelize.close();
      console.log("Closed MariaDB connection");
    } catch (error) {
      console.error("Error closing MariaDB connection:", error);
      throw error;
    }
  }
}
