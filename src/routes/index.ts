import express from 'express'; 
import routerSystem from './system';
import routerCatalog from './catalog';
import routerItem from './item';


export function routerApiV1(app: express.Application) {
    const router = express.Router();
    router.use('/system', routerSystem);
    router.use('/catalog', routerCatalog);
    router.use('/item', routerItem);
    app.use('/api/v1', router);
}
