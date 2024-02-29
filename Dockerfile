# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install any needed packages
RUN npm install

# Bundle app source
COPY . .

# Build the app
RUN npm run build

# Install serve to run the app
RUN npm install -g serve

# Make port 5000 available
EXPOSE 5000

# Define environment variable
ENV NODE_ENV=production

# Run serve when the container launches
CMD ["serve", "-s", "build", "-l", "5000"]
