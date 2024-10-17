import express from 'express'; 
import routerSystem from './system';


export function routerApiV1(app: express.Application) {
    const router = express.Router();
    router.use('/system', routerSystem);
    app.use('/api/v1', router);
}
