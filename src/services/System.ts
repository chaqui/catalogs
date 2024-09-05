import System from "../models/system";
import { SystemStorage } from "../storage/System";

export class SystemService {
  systemStorage: SystemStorage;

  constructor(systemStorage: SystemStorage) {
    this.systemStorage = systemStorage;
  }

  public saveSystem(system: System) {
    console.log("Saving system", system);
  }
}
