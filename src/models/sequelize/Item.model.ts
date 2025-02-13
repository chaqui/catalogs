import { 
  InferCreationAttributes,
  InferAttributes,
  Model, 
  DataTypes,
  Sequelize
} from "@sequelize/core";
import { Attribute, PrimaryKey, BelongsTo , Table} from '@sequelize/core/decorators-legacy';
import Catalog from "./Catalog.model";

@Table({
  tableName: 'item',
  schema: 'catalogs'
})
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

  @Attribute({type:DataTypes.INTEGER,
    field: 'catalog_id'}
  )
  declare catalogId: number;

  @Attribute({type:DataTypes.INTEGER,
    field: 'item_id'}
  )
  declare itemId: number;

}