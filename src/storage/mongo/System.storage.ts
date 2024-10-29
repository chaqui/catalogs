import { Collection, ObjectId,Document } from "mongodb";
import * as dotenv from "dotenv";
import Main from "./Main";
import System from "../../models/mongo/System.model";
import SystemCatalogInterface from "../inteface/System.interface";


export class SystemStorage extends Main implements SystemCatalogInterface {

  constructor() {
    dotenv.config();
    const collectionName = process.env.SYSTEM_COLLECTION || "";
    super(collectionName);
  }


  async create(system: System): Promise<any> {
    try {
      const collection = await this.connectToMongoDB();
      const result = await collection.insertOne(system);
      return result;
    } catch (error) {
      console.error("Failed to create system:", error);
      throw error;
    }
  }

  async read(id: string): Promise<any> {
    try {
      const collection = await this.connectToMongoDB();
      const result = await collection.findOne({ _id: new ObjectId(id) });
      return result;
    } catch (error) {
      console.error("Failed to read system:", error);
      throw error;
    }
  }

  async update(id: string, system: any): Promise<any> {
    try {
      const collection = await this.connectToMongoDB();
      const result = await collection.updateOne(
        { _id: new ObjectId(id) },
        { $set: system }
      );
      return result.modifiedCount > 0;
    } catch (error) {
      console.error("Failed to update system:", error);
      throw error;
    }
  }

  async delete(id: string): Promise<boolean> {
    try {
      const collection = await this.connectToMongoDB();
      const result = await collection.deleteOne({ _id: new ObjectId(id) });
      return result.deletedCount > 0;
    } catch (error) {
      console.error("Failed to delete system:", error);
      throw error;
    }
  }

  async readAll(): Promise<any[]> {
    try {
      const collection = await this.connectToMongoDB();
      const result = await collection.find().toArray();
      return result;
    } catch (error) {
      console.error("Failed to read all systems:", error);
      throw error;
    }
  }
}

export default SystemStorage;
