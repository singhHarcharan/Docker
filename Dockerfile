# These are all commands to create an image for nodejs application 
FROM node:20

WORKDIR /usr/src/app

# Copying package and prisma's files only not all, so that major layers can be cached in further commands.
COPY package* .                 
COPY ./prisma .
    
# By adding above two layers, we are caching expensive operation of npm install and prisma generate.
RUN npm install
RUN npx prisma generate

COPY . .

# Build the TypeScript code
RUN npm run build

EXPOSE 3000

# These are all commands to run the container
CMD ["node", "dist/index.js"]