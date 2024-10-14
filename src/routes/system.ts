import express, { Request, Response } from "express";
import { SystemService } from "../services/System";
import SystemStorage from "../storage/System";
const routerSystem = express.Router();

const systemService = new SystemService(new SystemStorage());

/**
 * Function to create a new system in the system storage and return the 
 * created system in the response with status code 201
 * 
 * @param req Request object
 * @param res Response object
 * @returns nothing
 */
routerSystem.post("/", async (req: Request, res: Response) => {
  await systemService.saveSystem(req.body);
  res.status(201).send(req.body);
});

/**
 * Function to get all systems from the system storage and return the systems 
 * in the response with status code 200 and 204 if no systems are found
 * 
 * @param req Request object
 * @param res Response object
 * @returns nothing
 */
routerSystem.get("/", async (req: Request, res: Response) => {
  const systems = await systemService.getSystems();
  if (systems.length === 0) {
    res.status(204).send();
  }
  res.status(200).send(systems);
});

/**
 * Function to get a system by id from the system storage and return the system 
 * in the response with status code 200
 * @param req Request object
 * @param res Response object
 * @returns nothing
 */
routerSystem.get("/:id", async (req: Request, res: Response) => {
  const system = await systemService.getSystem(req.params.id);
  res.status(200).send(system);
});

/**
 * Function to update a system in the system storage and return the updated system 
 * in the response with status code 200
 * 
 * @param req Request object
 * @param res Response object
 * @returns nothing
 */
routerSystem.put("/:id", async (req: Request, res: Response) => {
  await systemService.updateSystem(req.params.id, req.body);
  res.status(200).send(req.body);
});

/**
 * Function to delete a system by id from the system storage and return status code 204 
 * in the response if the system is deleted successfully
 * 
 * @param req Request object
 * @param res Response object
 * @returns nothing
 */
routerSystem.delete("/:id", async (req: Request, res: Response) => {
  await systemService.deleteSystem(req.params.id);
  res.status(204).send();
});

export default routerSystem;
