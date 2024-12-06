# Use the official Node.js 14 image as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

RUN npm rebuild && npm run test


# Expose the port that the application will listen on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]