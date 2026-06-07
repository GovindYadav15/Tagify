# Use official Node.js LTS image
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first for better caching
COPY package*.json ./

# Install dependencies
RUN npm ci --omit=dev

# Copy the rest of the application code
COPY . .

# Expose the port your app listens on
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
