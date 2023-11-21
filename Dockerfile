# Use an official Node runtime as a parent image
FROM node:14-alpine as build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the app's source code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Use Nginx as a base image
FROM nginx:1.21-alpine

# Copy the built React app from the build stage to the Nginx web root directory
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]


