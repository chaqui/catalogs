import { Sequelize } from "@sequelize/core";
import { SqliteDialect } from "@sequelize/sqlite3";
import CatalogStorage from "../../src/storage/mysql/Catalog.storage";
import { CatalogService } from "../../src/services/Catalog";
import { CustomError } from "bokchalhandler/dist/CustomError";
import ItemStorage from "../../src/storage/mysql/Item.storage";

jest.mock("../../src/storage/mysql/Catalog.storage");

describe("Catalog Service", () => {
  let sequelize: Sequelize;
  let catalogStorage: CatalogStorage;
  let catalogService: CatalogService;
  let itemStorage: ItemStorage;

  beforeAll(async () => {
    sequelize = new Sequelize({
      dialect: SqliteDialect,
      storage: "sequelize.sqlite",
    });

    catalogStorage = new CatalogStorage();
    itemStorage = new ItemStorage();

    catalogService = new CatalogService(catalogStorage,itemStorage);

    await sequelize.sync();
  });

  afterAll(async () => {
    await sequelize.close();
  });

  it("should get all catalogs", async () => {
    const catalogs = [
      { id: 1, name: "Catalog 1", description: "Description 1" },
      { id: 2, name: "Catalog 2", description: "Description 2" }
    ];
    catalogStorage.getCatalogs = jest.fn().mockResolvedValue(catalogs);
    const result = await catalogService.getCatalogs();
    expect(result).toEqual(catalogs);
  });

  it("should throw error when get all catalogs", async () => {
    catalogStorage.getCatalogs = jest.fn().mockRejectedValue(
      CustomError.notDataFound("Catalogs not found")
    );
    await expect(catalogService.getCatalogs()).rejects.toThrow("Catalogs not found");
  });

  it("should get items by catalogId", async () => {
    const items = [
      { id: 1, value: "Item 1", description: "Description 1", catalogId: 1 },
      { id: 2, value: "Item 2", description: "Description 2", catalogId: 1 }
    ];
    catalogStorage.getItemsByCatalogId = jest.fn().mockResolvedValue(items);
    const result = await catalogService.getItemsByCatalogId(1);
    expect(result).toEqual(items);
  });

  it("should throw error when get items by catalogId", async () => {
    catalogStorage.getItemsByCatalogId = jest.fn().mockRejectedValue(
      CustomError.notDataFound("Items not found")
    );
    await expect(catalogService.getItemsByCatalogId(1)).rejects.toThrow("Items not found");
  });

  it("should throw error when get items by catalogId", async () => {
    catalogStorage.getItemsByCatalogId = jest.fn().mockRejectedValue(
      CustomError.notDataFound("Items not found")
    );
    await expect(catalogService.getItemsByCatalogId(1)).rejects.toThrow("Items not found");
  });

  it("should get items by idItemProvider and idCatalog", async () => {
    const items = [
      { id: 1, value: "Item 1", description: "Description 1", catalogId: 1 },
      { id: 2, value: "Item 2", description: "Description 2", catalogId: 1 }
    ];
    itemStorage.getItemsByIdItemProvider = jest.fn().mockResolvedValue(items);
    const result = await catalogService.getItemsByIdItemProvider(1, 1);
    expect(result).toEqual(items);
  });
  
});
