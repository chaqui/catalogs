import { 
  InferCreationAttributes,
  InferAttributes,
  Model, 
  DataTypes,
  Sequelize
} from "@sequelize/core";
import { Attribute, PrimaryKey } from '@sequelize/core/decorators-legacy';

export default class Item extends Model<
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

}