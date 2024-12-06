import { Sequelize } from "@sequelize/core";
import { MariaDbDialect } from "@sequelize/mariadb";
import * as dotenv from "dotenv";
import Catalog from "../../models/sequelize/Catalog.model";
import Item from "../../models/sequelize/Item.model";

dotenv.config();

const sequelize = new Sequelize({
      dialect: MariaDbDialect,
      host: process.env.MYSQL_HOST || "localhost",
      port: parseInt(process.env.MYSQL_PORT || "3306"),
      user: process.env.MYSQL_USER || "root",
      password: process.env.MYSQL_PASSWORD || "password",
      database: process.env.MYSQL_DATABASE || "catalogs",
      models: [Catalog, Item],
    }); 
export default sequelize;