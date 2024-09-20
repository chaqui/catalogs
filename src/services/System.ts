import System from "../models/System";
import { SystemStorage } from "../storage/System";

export class SystemService {
  systemStorage: SystemStorage;

  constructor(systemStorage: SystemStorage) {
    this.systemStorage = systemStorage;
  }

  public async saveSystem(system: System) {
    console.log("Saving system:", system);
    await this.systemStorage.create(system);
  }

  public async getSystems(): Promise<System[]> {
    const systems = await this.systemStorage.readAll();
    return systems;
  }

  public async getSystem(id: string): Promise<System> {
    const system = await this.systemStorage.read(id);
    return system;
  }

  public async updateSystem(id: string, system: System) {
    console.log("Updating system:", system);
    await this.systemStorage.update(id, system);
  }

  public async deleteSystem(id: string) {
    console.log("Deleting system:", id);
    await this.systemStorage.delete(id);
  }
  
}
