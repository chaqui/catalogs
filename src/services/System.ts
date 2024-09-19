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
}
