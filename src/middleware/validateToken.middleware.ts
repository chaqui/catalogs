import { Request, Response, NextFunction } from "express";
import { validateToken } from "../services/Auth";

/**
 * Middleware to validate the token in the request headers
 *
 * @param req Request object
 * @param res Response object
 * @param next Function to call the next middleware
 * @returns nothing
 */
export function validateTokenMiddleware(
  req: Request,
  res: Response,
  next: NextFunction
): void {
  const token = req.headers.authorization;
  console.log(token);
  if (!token) {
    res.status(401).send("Unauthorized");
    return;
  }
  const head = token.split(" ");
  if (head[0] !== "Bearer") {
    res.status(401).send("Unauthorized");
    return;
  }
  try {
    validateToken(token).then((response) => {
      if (response.status === 401) {
        res.status(401).send("Unauthorized");
        return;
      }
      next();
    });
  } catch (error) {
    res.status(401).send("Unauthorized");
    return;
  }

  next();
}
