import { Sequelize } from "@sequelize/core";
import { MariaDbDialect } from "@sequelize/mariadb";
import { PostgresDialect } from "@sequelize/postgres";
import * as dotenv from "dotenv";
import Catalog from "../../models/sequelize/Catalog.model";
import Item from "../../models/sequelize/Item.model";

dotenv.config();

const database = process.env.DB || "mysql";
let sequelize;
if (database === "postgres") {
  sequelize = new Sequelize({
    dialect: PostgresDialect,
    host: process.env.DB_HOST || "localhost",
    port: parseInt(process.env.DB_PORT || "5432"),
    user: process.env.DB_USERNAME || "root",
    password: process.env.DB_PASSWORD || "password",
    database: process.env.DB_DATABASE || "catalogs",
    ssl: false,
    clientMinMessages: "notice",
    models: [Catalog, Item],
  });
} else {
  sequelize = new Sequelize({
    dialect: MariaDbDialect,
    host: process.env.MYSQL_HOST || "localhost",
    port: parseInt(process.env.MYSQL_PORT || "3306"),
    user: process.env.MYSQL_USER || "root",
    password: process.env.MYSQL_PASSWORD || "password",
    database: process.env.MYSQL_DATABASE || "catalogs",
    models: [Catalog, Item],
  });
}
export default sequelize;
