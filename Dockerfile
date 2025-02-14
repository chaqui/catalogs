# Use the official Node.js 14 image as the base image
FROM node:20-alpine

WORKDIR /app

# Copiar los archivos de package.json y package-lock.json
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto de los archivos del proyecto
COPY . .

# Compilar el proyecto para producción
RUN npm run build

FROM node:20-alpine

WORKDIR /app

# Copiar los archivos compilados desde la etapa de construcción
COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./

# Instalar solo las dependencias de producción
RUN npm install --only=production

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "dist/index.js"]