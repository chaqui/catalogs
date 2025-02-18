import axios from "axios";
import * as dotenv from "dotenv";

dotenv.config();

const serviceCore = process.env.SERVICE_CORE;

export async function validateToken(token: string): Promise<any> {
  const url = `${serviceCore}/api/validate`;
  console.log(url);
  try {
    const response = await axios.get(url, {
      headers: {
        Authorization: token,
      },
    });
    return response;
  } catch (error) {
    console.error("Error validating token:", error);
    throw error;
  }
}