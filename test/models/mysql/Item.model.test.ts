import { Sequelize } from "@sequelize/core";
import { SqliteDialect } from "@sequelize/sqlite3";
import Catalog from "../../../src/models/sequelize/Catalog.model";
import Item from "../../../src/models/sequelize/Item.model";

describe("Item Model", () => {
  let sequelize: Sequelize;
  let catalog: any;
  let item: any;

  beforeAll(async () => {
    sequelize = new Sequelize({
      dialect: SqliteDialect,
      storage: "sequelize.sqlite",
      models: [Catalog, Item], // Pass the models here
    });

    // Sync the database to ensure the models are initialized
    await sequelize.sync();
 
    catalog = { id: Math.floor(Math.random() * 100), name: "Test Catalog", description: "test" };
    item = { id: 1, value: "Test Item", description: "test", catalogId: catalog.id };

  });

  afterAll(async () => {
    await sequelize.close();
  });

  it("should create a new item entry", async () => {
    await sequelize.sync({ force: true });

    // Create a related Catalog record
    const catalogRequest = await Catalog.create(catalog);

    const itemRequest = await Item.create(item);
    expect(itemRequest).toBeDefined();
    expect(itemRequest.value).toBe("Test Item");
  });

  it("should find an item entry by ID", async () => {
    await sequelize.sync({ force: true });

    // Create a related Catalog record
    const catalogRequest = await Catalog.create(catalog);

    const itemRequest = await Item.create(item);
    const foundItem = await Item.findByPk(itemRequest.id);
    expect(foundItem).toBeDefined();
    expect(foundItem?.value).toBe("Test Item");
  });

  it("should update an item entry", async () => {
    await sequelize.sync({ force: true });

    // Create a related Catalog record
    const catalogRequest = await Catalog.create(catalog);

    const itemRequest = await Item.create(item);
    itemRequest.value = "Updated Item";
    await itemRequest.save();

    const updatedItem = await Item.findByPk(itemRequest.id);
    expect(updatedItem?.value).toBe("Updated Item");
  });

  it("should delete an item entry", async () => {
    await sequelize.sync({ force: true });

    // Create a related Catalog record
    const catalogRequest = await Catalog.create(catalog);

    const itemRequest = await Item.create(item);
    await itemRequest.destroy();

    const deletedItem = await Item.findByPk(itemRequest.id);
    expect(deletedItem).toBeNull();
  });
});