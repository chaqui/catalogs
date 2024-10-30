import { SystemService } from "../../src/services/System";
import { SystemStorage } from "../../src/storage/mongo/System.storage";
import System from "../../src/models/mongo/System.model";
import { CustomError } from "bokchalhandler/dist/CustomError";

jest.mock("../../src/storage/mongo/System.storage");

/**
 * Test suite for SystemService class
 */
describe("SystemService", () => {
  let systemService: SystemService;
  let systemStorage: jest.Mocked<SystemStorage>;

  beforeEach(() => {
    systemStorage = new SystemStorage() as jest.Mocked<SystemStorage>;
    systemService = new SystemService(systemStorage);
  });

  it("should save a system", async () => {
    const system = new System(2, "System 2", "Description 2");
    await systemService.saveSystem(system);
    expect(systemStorage.create).toHaveBeenCalledWith(system);
  });

  it("should get all systems", async () => {
    const systems = [
      new System(1, "System 1", "Description 1"),
      new System(2, "System 2", "Description 2"),
    ];
    systemStorage.readAll.mockResolvedValue(systems);
    const result = await systemService.getSystems();
    expect(result).toEqual(systems);
  });

  it("should get a system by id", async () => {
    const system = new System(1, "System 1", "Description 1");
    systemStorage.read.mockResolvedValue(system);
    const result = await systemService.getSystem("1");
    expect(result).toEqual(system);
  });

  it("should throw an error if system is not found by id", async () => {
    systemStorage.read.mockResolvedValue(null);
    await expect(systemService.getSystem("1")).rejects.toThrow(
      CustomError.notFound("System not found")
    );
  });

  it("should update a system", async () => {
    const system = new System(1, "System 3", "Description 1");
    await systemService.updateSystem("1", system);
    expect(systemStorage.update).toHaveBeenCalledWith("1", system);
  });

  it("should delete a system", async () => {
    await systemService.deleteSystem("1");
    expect(systemStorage.delete).toHaveBeenCalledWith("1");
  });
});

// We recommend installing an extension to run jest tests.
