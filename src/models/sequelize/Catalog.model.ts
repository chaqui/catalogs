import { 
  InferCreationAttributes,
  InferAttributes,
  Model, 
  DataTypes,
  Sequelize
} from "@sequelize/core";
import { Attribute, PrimaryKey, HasMany, Table, ColumnName } from '@sequelize/core/decorators-legacy';
import Item from "./Item.model";

@Table({
  tableName: 'catalogs' ,
  schema: 'catalogs'
})
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

  @Attribute(DataTypes.DATE)
  @ColumnName('createdat')
  declare createdAt: Date;

  @Attribute(DataTypes.DATE)
  @ColumnName('updatedat')
  declare updatedAt: Date;

  @HasMany(() => Item, 'catalogId')
  declare items?: Item[];
}