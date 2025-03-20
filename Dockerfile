# Use an official Node.js runtime as the base image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json .
RUN npm install

# Copy the application files
COPY . .

# Expose the application port
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
