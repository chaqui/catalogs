import { Request, Response, NextFunction } from 'express';
import { CustomError } from './CustomError';

/**
 * Function to log the error
 * @param err Error object
 * @param req Request object
 * @param res Response object
 * @param next Function to call the next middleware
 */
export function getLogErrorMiddleware(err: Error, req: Request, res: Response, next: NextFunction) {
    console.log('Entered getLogErrorMiddleware');
    console.error(err.stack);
    next(err);
}

/**
 * Function to handle custom errors 
 * @param err Error object 
 * @param req Request object
 * @param res Response object
 * @param next Function to call the next middleware
 * @returns nothing
 */
export function customErrorMiddleware(err: Error, req: Request, res: Response, next: NextFunction) {
    if(err instanceof CustomError) {
        res.status(err.statusCode).send(err.message);
        return;
    }
    next(err);
}

/**
 * Function to handle errors
 * @param err Error object
 * @param req Request object
 * @param res Response object
 * @param next Function to call the next middleware
 * @returns nothing
 */ 
export function errorMiddlleware(err: Error, req: Request, res: Response, next: NextFunction) {
    res.status(500).send('Something broke!');
}