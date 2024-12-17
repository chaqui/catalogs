import cors from "cors";

const corsOptionsDevelopment: cors.CorsOptions = {
  origin: (origin, callback) => {
    if (origin && /^http:\/\/localhost:\d+$/.test(origin)) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS"));
    }
  }
};

const corsOptionsProduction: cors.CorsOptions = {
  origin: (origin, callback) => {
    if (origin && /^https:\/\/myproductiondomain\.com$/.test(origin)) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS"));
    }
  }
};

const corsLocalNetwork: cors.CorsOptions = {
  origin: (origin, callback) => {
    if (!origin || /^http:\/\/localhost:\d+$/.test(origin) || /^http:\/\/192\.168\.\d+\.\d+:\d+$/.test(origin)) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS"));
    }
  }
};

const getCorsOptions = (env: string): cors.CorsOptions => {
  if (env === "development") {
    return corsOptionsDevelopment;
  } else if (env === "production") {
    return corsOptionsProduction;
  }
  else if (env === "localnetwork") {
    return corsLocalNetwork;
    
  } else {
    return {}; // Default CORS options
  }
};

export default getCorsOptions;