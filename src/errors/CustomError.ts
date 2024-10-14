import { HttpErrors } from "../constants/HttpErrors";


/**
 * CustomError class to handle custom errors in the application
 */
export class CustomError extends Error {
  message: string;
  statusCode: number;

  /**
   * Constructor for the CustomError class is private to prevent instantiation of the class directly
   * @param message Message to be displayed
   * @param statusCode Code of the HTTP status to be returned
   */
  private constructor(message: string, statusCode: number) {
    super(message);
    this.message = message;
    this.name = "CustomError";
    this.statusCode = statusCode;
  }

  /**
   * Function to return the string representation of the error
   * @returns string
   */
  toString(): string {
    return `${this.name}: ${this.message}`;
  }

  /**
   * Function to create a new CustomError object with status code 400 (Bad Request)
   * @param message Message to be displayed
   * @returns CustomError object with status code 400 (Bad Request) and the message
   */
  static badRequest(message: string) {
    return new CustomError(message, HttpErrors.BadRequest);
  }

  /**
   * Function to create a new CustomError object with status code 404 (Not Found)
   * @param message Message to be displayed
   * @returns CustomError object with status code 404 (Not Found) and the message
   */
  static notFound(message: string) {
    return new CustomError(message, HttpErrors.NotFound);
  }

  /**
   * Function to create a new CustomError object with status code 500 (Internal Server Error)
   * @param message Message to be displayed
   * @returns CustomError object with status code 500 (Internal Server Error) and the message
   */
  static internalServerError(message: string) {
    return new CustomError(message, HttpErrors.InternalServerError);
  }

  /**
   * Function to create a new CustomError object with status code 401 (Unauthorized)
   * @param message Message to be displayed
   * @returns CustomError object with status code 401 (Unauthorized) and the message
   */
  static unauthorized(message: string) {
    return new CustomError(message, HttpErrors.Unauthorized);
  }

  /**
   * Function to create a new CustomError object with status code 403 (Forbidden)
   * @param message Message to be displayed
   * @returns CustomError object with status code 403 (Forbidden) and the message
   */
  static forbidden(message: string) {
    return new CustomError(message, HttpErrors.Forbidden);
  }

  /**
   * Function to create a new CustomError object with status code 409 (Conflict)
   * @param message Message to be displayed
   * @returns CustomError object with status code 409 (Conflict) and the message
   */
  static conflict(message: string) {
    return new CustomError(message, HttpErrors.Conflict);
  }

  /**
   * Function to create a new CustomError object with status code 204 (No Content)
   * @param message Message to be displayed
   * @returns CustomError object with status code 204 (No Content) and the message
   */
  static notDataFound(message: string) {
    return new CustomError(message, HttpErrors.NoContent);
  }
}
