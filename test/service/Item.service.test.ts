import { Sequelize } from "@sequelize/core";
import { SqliteDialect } from "@sequelize/sqlite3";
import { CustomError } from "bokchalhandler/dist/CustomError";
import ItemService from "../../src/services/Item";
import ItemStorage from "../../src/storage/mysql/Item.storage";

jest.mock("../../src/storage/mysql/Item.storage");

describe("Item Service", () => {
  let sequelize: Sequelize;
  let itemService: ItemService;
  let itemStorage: ItemStorage;

  beforeAll(async () => {
    sequelize = new Sequelize({
      dialect: SqliteDialect,
      storage: "sequelize.sqlite",
    });
    
    itemStorage = new ItemStorage();
    itemService = new ItemService(itemStorage);

    await sequelize.sync();
  });

  afterAll(async () => {
    await sequelize.close();
  });

  it("should get all items", async () => {
    const items = [
      { id: 1, value: "Item 1", description: "Description 1", catalogId: 1 },
      { id: 2, value: "Item 2", description: "Description 2", catalogId: 1 }
    ];
    itemService.getItems = jest.fn().mockResolvedValue(items);
    const result = await itemService.getItems();
    expect(result.length).toBe(2);
    expect(result).toEqual(items);
  });

  it("should throw error when get all items", async () => {
    itemService.getItems = jest.fn().mockRejectedValue(
      CustomError.notDataFound("Items not found")
    );
    await expect(itemService.getItems()).rejects.toThrow("Items not found");
  });
});