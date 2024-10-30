import { CatalogService } from "../../src/services/Catalog";
import CatalogStorage  from "../../src/storage/mysql/Catalog.storage";
import Catalog from "../../src/models/sql/Catalog.model";
import { CustomError } from "bokchalhandler/dist/CustomError";

jest.mock("../../src/storage/mysql/Catalog.storage");

/**
 * Test suite for CatalogService class
 */
describe("CatalogService", () => {
  let catalogService: CatalogService;
  let catalogStorage: jest.Mocked<CatalogStorage>;

  beforeEach(() => {
    catalogStorage = new CatalogStorage() as jest.Mocked<CatalogStorage>;
    catalogService = new CatalogService(catalogStorage);
  });

  it("should get all catalogs", async () => {
    const catalogs = [
        new Catalog({ id: 1, name: "Catalog 1", description: "Description 1" }),
        new Catalog({ id: 2, name: "Catalog 2", description: "Description 2" }),
    ];
    catalogStorage.getCatalogs.mockResolvedValue(catalogs);
    const result = await catalogService.getCatalogs();
    expect(result).toEqual(catalogs);
  });

  it("should throw error when get all catalogs", async () => {
    catalogStorage.getCatalogs.mockRejectedValue(
      CustomError.notDataFound("Catalogs not found")
    );
    await expect(catalogService.getCatalogs()).rejects.toThrowError(
      CustomError.notDataFound("Catalogs not found")
    );
  });

  it("should get items by catalogId", async () => {
    const catalogId = 1;
    const items = [
      { id: 1, name: "Item 1" },
      { id: 2, name: "Item 2" },
    ];
    catalogStorage.getItemsByCatalogId.mockResolvedValue(items);
    const result = await catalogService.getItemsByCatalogId(catalogId);
    expect(result).toEqual(items);
  });

  it("should throw error when get items by catalogId", async () => {
    const catalogId = 1;
    catalogStorage.getItemsByCatalogId.mockRejectedValue(
      CustomError.notFound("Catalog not found")
    );
    await expect(
      catalogService.getItemsByCatalogId(catalogId)
    ).rejects.toThrowError(CustomError.notFound("Catalog not found"));
  });
});
