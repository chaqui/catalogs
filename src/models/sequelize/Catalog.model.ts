import { 
  InferCreationAttributes,
  InferAttributes,
  Model, 
  DataTypes,
  Sequelize
} from "@sequelize/core";
import { Attribute, PrimaryKey, HasMany } from '@sequelize/core/decorators-legacy';
import Item from "./Item.model";

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

  @HasMany(() => Item, 'catalogId')
  declare items?: Item[];
}