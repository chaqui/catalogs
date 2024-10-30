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
export class Item extends Model<
  InferAttributes<Item>,
  InferCreationAttributes<Item>
> {
  @Attribute(DataTypes.INTEGER)
  @PrimaryKey
  declare id: number;

  @Attribute(DataTypes.STRING)
  declare value: string;

  @Attribute(DataTypes.STRING)
  declare description: string;

  @Attribute(DataTypes.INTEGER)
  declare catalogId: number;

  static initModel(sequelize: Sequelize) {
    Item.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
        },
        value: {
          type: DataTypes.STRING,
        },
        description: {
          type: DataTypes.STRING,
        },
        catalogId: {
          type: DataTypes.INTEGER,
        },
      },
      {
        sequelize,
        modelName: "Item",
        tableName: "items",
        timestamps: false,
      }
    );
  }
}
