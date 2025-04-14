# FROM node:18-alpine
# WORKDIR /app
# RUN npm install -g npm@9
# COPY package*.json .
# COPY packages ./packages
# COPY themes ./themes
# COPY extensions ./extensions
# COPY public ./public
# COPY media ./media
# COPY config ./config
# COPY translations ./translations
# RUN npm install
# RUN npm run build

# EXPOSE 80
# CMD ["npm", "run", "start"]
# Use Node.js as base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Build the application
RUN npm run build

# Expose the port Evershop uses
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
