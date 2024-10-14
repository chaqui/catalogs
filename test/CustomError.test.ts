import { CustomError } from '../src/errors/CustomError';

/**
 * Test suite for CustomError class
 */
describe('CustomError', () => {
    
    it('should create a bad request error', () => {
        const error = CustomError.badRequest('Bad request error');
        expect(error).toBeInstanceOf(CustomError);
        expect(error.message).toBe('Bad request error');
        expect(error.statusCode).toBe(400);
    });

    it('should create a not found error', () => {
        const error = CustomError.notFound('Not found error');
        expect(error).toBeInstanceOf(CustomError);
        expect(error.message).toBe('Not found error');
        expect(error.statusCode).toBe(404);
    });

    it('should create an internal server error', () => {
        const error = CustomError.internalServerError('Internal server error');
        expect(error).toBeInstanceOf(CustomError);
        expect(error.message).toBe('Internal server error');
        expect(error.statusCode).toBe(500);

    });

    it('should create an unauthorized error', () => {
        const error = CustomError.unauthorized('Unauthorized error');
        expect(error).toBeInstanceOf(CustomError);
        expect(error.message).toBe('Unauthorized error');
        expect(error.statusCode).toBe(401);
        expect(error instanceof CustomError).toBe(true);
    });

    it('should create a forbidden error', () => {
        const error = CustomError.forbidden('Forbidden error');
        expect(error).toBeInstanceOf(CustomError);
        expect(error.message).toBe('Forbidden error');
        expect(error.statusCode).toBe(403);
    });

    it('should create a conflict error', () => {
        const error = CustomError.conflict('Conflict error');
        expect(error).toBeInstanceOf(CustomError);
        expect(error.message).toBe('Conflict error');
        expect(error.statusCode).toBe(409);
    });

    it('should return the correct string representation of the error', () => {
        const error = CustomError.badRequest('Bad request error');
        expect(error.toString()).toBe('CustomError: Bad request error');
    });
});