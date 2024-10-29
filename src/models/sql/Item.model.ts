import { 
    InferCreationAttributes,
    InferAttributes,
    Model, 
    DataTypes} from "@sequelize/core"
import { Attribute, PrimaryKey, NotNull } from '@sequelize/core/decorators-legacy';


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
}