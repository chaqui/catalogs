import { Request, Response, NextFunction } from 'express';


export function exceptionMiddleware(err: any, req: Request, res: Response, next: NextFunction) {
    console.error(err.stack);
    res.status(500).send('Something broke!');
}

export function happyMiddleware(err: any, req: Request, res: Response, next: NextFunction) {
    if(!err.isBoom) {
        return next(err);
    }
    return res.status(err.output.statusCode).json(err.output.payload);
}