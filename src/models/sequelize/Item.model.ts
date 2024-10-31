import {
  InferCreationAttributes,
  InferAttributes,
  Model,
  DataTypes,
  Sequelize,
} from "@sequelize/core";
import {
  Attribute,
  PrimaryKey,
  NotNull,
} from "@sequelize/core/decorators-legacy";
import { MariaDbDialect } from "@sequelize/mariadb";

const sequelize = new Sequelize({ dialect: MariaDbDialect });
export default class Item extends Model
{
  @Attribute(DataTypes.INTEGER)
  @PrimaryKey
  declare id: number;

  @Attribute(DataTypes.STRING)
  declare value: string;

  @Attribute(DataTypes.STRING)
  declare description: string;

  @Attribute(DataTypes.INTEGER)
  declare catalogId: number;

}
