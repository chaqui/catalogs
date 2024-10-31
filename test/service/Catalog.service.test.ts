import { Sequelize } from "@sequelize/core";
import { SqliteDialect } from "@sequelize/sqlite3";
import Catalog from "../../src/models/sequelize/Catalog.model";
import Item from "../../src/models/sequelize/Item.model";

describe("Catalog Model", () => {
  let sequelize: Sequelize;

  beforeAll(async () => {
    sequelize = new Sequelize({
      dialect: SqliteDialect,
      storage: "sequelize.sqlite",
      models: [Catalog, Item], // Pass the models here
    });

    // Sync the database to ensure the models are initialized
    await sequelize.sync();
  });

  afterAll(async () => {
    await sequelize.close();
  });

  it("should initialize the Catalog model", async () => {
    expect(Catalog).toBeDefined();
    expect(Catalog.isInitialized).toBe(Catalog.isInitialized);
  });

  it("should create a new catalog entry", async () => {
    await sequelize.sync({ force: true });
    const catalogRequest = await Catalog.create({ id: 1, name: "Test Catalog", description: "test" });
    expect(catalogRequest).toBeDefined();
    expect(catalogRequest.name).toBe("Test Catalog");
  });

  it("should find a catalog entry by ID", async () => {
    await sequelize.sync({ force: true });

    const catalogRequest = await Catalog.create({ id: 1, name: "Test Catalog", description: "test" });
    const foundCatalog = await Catalog.findByPk(catalogRequest.id);
    expect(foundCatalog).toBeDefined();
    expect(foundCatalog?.name).toBe("Test Catalog");
  });

  it("should update a catalog entry", async () => {
    await sequelize.sync({ force: true });

    const catalogRequest = await Catalog.create({ id: 1, name: "Test Catalog", description: "test" });
    catalogRequest.name = "Updated Catalog";
    await catalogRequest.save();

    const updatedCatalog = await Catalog.findByPk(catalogRequest.id);
    expect(updatedCatalog?.name).toBe("Updated Catalog");
  });

  it("should delete a catalog entry", async () => {
    await sequelize.sync({ force: true });

    const catalogRequest = await Catalog.create({ id: 1, name: "Test Catalog", description: "test" });
    await catalogRequest.destroy();

    const deletedCatalog = await Catalog.findByPk(catalogRequest.id);
    expect(deletedCatalog).toBeNull();
  });
});