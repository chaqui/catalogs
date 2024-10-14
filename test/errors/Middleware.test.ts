import { Request, Response, NextFunction } from 'express';
import { customErrorMiddleware, getLogErrorMiddleware, errorMiddlleware } from '../../src/errors/ExceptionMiddlewares';
import { CustomError } from '../../src/errors/CustomError';

describe('ExceptionMiddlewares', () => {
    let req: Partial<Request>;
    let res: Partial<Response>;
    let next: NextFunction;

    beforeEach(() => {
        req = {};
        res = {
            status: jest.fn().mockReturnThis(),
            send: jest.fn().mockReturnThis(),
        };
        next = jest.fn();
    });

    it('should return error message with status code', () => {
        const error =  CustomError.notFound('Error message');
        customErrorMiddleware(error, req as Request, res as Response, next);
        expect(res.status).toHaveBeenCalledWith(404);
       
    });

    it('should return 400', () => {
        const error = CustomError.badRequest('Error message');
        customErrorMiddleware(error, req as Request, res as Response, next);
        expect(res.status).toHaveBeenCalledWith(400);
    });

    it('should return 401', () => {
        const error = CustomError.unauthorized('Error message');
        customErrorMiddleware(error, req as Request, res as Response, next);
        expect(res.status).toHaveBeenCalledWith(401);
    });

    it('should return 403', () => {
        const error = CustomError.forbidden('Error message');
        customErrorMiddleware(error, req as Request, res as Response, next);
        expect(res.status).toHaveBeenCalledWith(403);
    });

    it('should return 500', () => {
        const error = CustomError.internalServerError('Error message');
        customErrorMiddleware(error, req as Request, res as Response, next);
        expect(res.status).toHaveBeenCalledWith(500);
    });

    it('should return 409', () => {
        const error = CustomError.conflict('Error message');
        customErrorMiddleware(error, req as Request, res as Response, next);
        expect(res.status).toHaveBeenCalledWith(409);
    });

    it('should call next function', () => {
        const error = new Error('Error message');
        customErrorMiddleware(error, req as Request, res as Response, next);
        expect(next).toHaveBeenCalledWith(error);
    });

});

describe('getLogErrorMiddleware', () => {

    it('should log the error', () => {
        const error = new Error('Error message');
        const req = {} as Request;
        const res = {} as Response;
        const next = jest.fn();
        getLogErrorMiddleware(error, req, res, next);
        expect(next).toHaveBeenCalledWith(error);
    });
});
