import * as dotenv from "dotenv";
import jwt from "jsonwebtoken";

dotenv.config();

const secretKey = process.env.JWT_SECRET_KEY || "your-secret-key";


export function validateToken(token: string): any {
  try {
    // Verificar y decodificar el token
    const decoded = jwt.verify(token, secretKey);
    console.log(decoded);
    return true;
  } catch (error) {
    return false;
  }
}