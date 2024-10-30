import { Sequelize } from "@sequelize/core";
import { SqliteDialect } from "@sequelize/sqlite3";
import  Catalog  from "../../../src/models/sql/Catalog.model";

describe("Catalog Model", () => {
  let sequelize: Sequelize;

  beforeAll(async () => {
    sequelize = new Sequelize({
      dialect: SqliteDialect,
      storage: "sequelize.sqlite",
    });
    await sequelize.authenticate();
  });

  afterAll(async () => {
    await sequelize.close();
  });

  it("should initialize the Catalog model", async () => {
    Catalog.initModel(sequelize);
    expect(Catalog).toBeDefined();
    expect(Catalog.sequelize).toBe(sequelize);
  });

  it("should create a new catalog entry", async () => {

    await sequelize.sync({ force: true });

    const catalog = await Catalog.create(new Catalog({id:1, description:"test", name: "Test Catalog" }));
    expect(catalog).toBeDefined();
    expect(catalog.name).toBe("Test Catalog");
  });

  it("should find a catalog entry by ID", async () => {
    await sequelize.sync({ force: true });

    const catalog = await Catalog.create(new Catalog({id:1, description:"test", name: "Test Catalog" }));
    const foundCatalog = await Catalog.findByPk(catalog.id);

    expect(foundCatalog).toBeDefined();
    expect(foundCatalog?.name).toBe("Test Catalog");
  });

  it("should update a catalog entry", async () => {
    await sequelize.sync({ force: true });

    const catalog = await Catalog.create(new Catalog({id:1, description:"test", name: "Test Catalog" }));
    catalog.name = "Updated Catalog";
    await catalog.save();

    const updatedCatalog = await Catalog.findByPk(catalog.id);
    expect(updatedCatalog?.name).toBe("Updated Catalog");
  });

  it("should delete a catalog entry", async () => {
    await sequelize.sync({ force: true });

    const catalog = await Catalog.create(new Catalog({id:1, description:"test", name: "Test Catalog" }));
    await catalog.destroy();

    const deletedCatalog = await Catalog.findByPk(catalog.id);
    expect(deletedCatalog).toBeNull();
  });
});
