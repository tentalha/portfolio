# Use an official Node.js LTS (Long Term Support) image as a base image
FROM node:18-alpine

# Create and set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install --force

# Copy the rest of the application code to the container
COPY . .

# Build the Next.js application
RUN npm run build --force

# Expose the port that Next.js will run on
EXPOSE 3000

# Set the environment variable to production
ENV NODE_ENV=production

# Start the Next.js application
CMD ["npm", "start"]
