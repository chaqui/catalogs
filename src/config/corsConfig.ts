import cors from "cors";
const corsOptions: cors.CorsOptions = {
  origin: "*", // Permitir cualquier origen
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"],
};

export default corsOptions;
