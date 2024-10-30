import {
  InferCreationAttributes,
  InferAttributes,
  Model,
  DataTypes,
  Sequelize,
  NonAttribute,
} from "@sequelize/core";

import {
  Attribute,
  PrimaryKey,
  NotNull,
  HasMany,
} from "@sequelize/core/decorators-legacy";
import { Item } from "./Item.model";
import { MariaDbDialect } from "@sequelize/mariadb";

const sequelize = new Sequelize({ dialect: MariaDbDialect });
export default class Catalog extends Model<
  InferAttributes<Catalog>,
  InferCreationAttributes<Catalog>
> {
  @Attribute(DataTypes.INTEGER)
  @PrimaryKey
  declare id: number;

  @Attribute(DataTypes.STRING)
  declare name: string;

  @Attribute(DataTypes.STRING)
  declare description: string;

  @HasMany(() => Item, "catalogId")
  declare items: NonAttribute<Item[]>;

  static initModel(sequelize: Sequelize) {
    Catalog.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
        },
        name: {
          type: DataTypes.STRING,
          allowNull: false,
        },
        description: {
          type: DataTypes.STRING,
        },
      },
      {
        sequelize,
        modelName: "Catalog",
        tableName: "catalogs",
        timestamps: false,
      }
    );
  }
}
