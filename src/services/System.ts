import System from "../models/System";
import { SystemStorage } from "../storage/System";
import { CustomError } from "bokchalhandler/dist/CustomError";

/**
 * Class to handle system related operations
 */
export class SystemService {
  /**
   * Storage to store system data
   */
  systemStorage: SystemStorage;

  /**
   * Constructor to initialize system storage
   * @param systemStorage Storage to store system data
   */
  constructor(systemStorage: SystemStorage) {
    this.systemStorage = systemStorage;
  }

  /**
   * Function to save a system in the system storage
   * @param system System to be saved
   */
  public async saveSystem(system: System) {
    await this.systemStorage.create(system);
  }

  /**
   * Function to get all systems from the system storage
   * @returns Array of systems
   */
  public async getSystems(): Promise<System[]> {
    const systems = await this.systemStorage.readAll();
    return systems;
  }

  /**
   * Function to get a system by id from the system storage
   * @param id Id of the system to be fetched
   * @returns System object
   */
  public async getSystem(id: string): Promise<System> {
    console.log(id);
    const system = await this.systemStorage.read(id);
    console.log(system);
    if(!system) {
      throw CustomError.notFound("System not found");
    }
    return system;
  }

  /**
   * Function to update a system in the system storage
   * @param id Id of the system to be updated
   * @param system System object with updated values
   */
  public async updateSystem(id: string, system: System) {
    await this.systemStorage.update(id, system);
  }

  /**
   * Function to delete a system from the system storage
   * @param id Id of the system to be deleted
   */
  public async deleteSystem(id: string) {
    await this.systemStorage.delete(id);
  }
  
}
