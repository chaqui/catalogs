import {
  CreationOptional,
  InferAttributes,
  Model,
  DataTypes,
  InferCreationAttributes,
  NonAttribute,
} from "@sequelize/core";
import {
  Attribute,
  PrimaryKey,
  NotNull,
  HasMany,
} from "@sequelize/core/decorators-legacy";
import { Item } from "./Item.model";

export class Catalog extends Model<
  InferAttributes<Catalog>,
  InferCreationAttributes<Catalog>
> {
  @Attribute(DataTypes.INTEGER)
  @PrimaryKey
  declare id: CreationOptional<number>;

  @Attribute(DataTypes.STRING)
  @NotNull
  declare name: string;

  @Attribute(DataTypes.STRING)
  declare description: string;

  @HasMany(() => Item, "catalogId")
  declare items: NonAttribute<Item[]>;
}
