import express, { Request, Response } from "express";
import { SystemService } from "../services/System";
import SystemStorage from "../storage/System";
const routerSystem = express.Router();

const systemService = new SystemService(new SystemStorage());

routerSystem.post("/", async (req: Request, res: Response) => {
  await systemService.saveSystem(req.body);
  res.send("System saved");
});

routerSystem.get("/", async (req: Request, res: Response) => {
  const systems = await systemService.getSystems();
  res.send(systems);
});

routerSystem.get("/:id", async (req: Request, res: Response) => {
  const system = await systemService.getSystem(req.params.id);
  res.send(system);
});

routerSystem.put("/:id", async (req: Request, res: Response) => {
  await systemService.updateSystem(req.params.id, req.body);
  res.send("System updated");
});

routerSystem.delete("/:id", async (req: Request, res: Response) => {
  await systemService.deleteSystem(req.params.id);
  res.send("System deleted");
});

export default routerSystem;
