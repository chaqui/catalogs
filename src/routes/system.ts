import express, { Request, Response } from 'express';
import { SystemService } from '../services/System';
import SystemStorage from '../storage/System';
const routerSystem = express.Router();

const systemService = new SystemService(new SystemStorage());

routerSystem.post('/', async (req: Request, res: Response) => {
    await systemService.saveSystem(req.body);
    res.send('System saved');
});

export default routerSystem;