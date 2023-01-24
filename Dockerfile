# Use the node:10-alpine image
FROM nginx:10-alpine

# Create a directory for the app and its node_modules with node as its owner
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

USER node

# Set the working directory to the app directory
WORKDIR /home/node/app

# Copy the website files to the container
COPY package*.json ./

# Install all packages in package.json
RUN npm install

COPY --chown=node:node . .

# Expose port 8080 for incoming traffic
EXPOSE 8080

# Run the app
CMD ["node", "app.js"]
