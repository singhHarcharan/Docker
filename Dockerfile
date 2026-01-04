# These are all commands to create an image for nodejs application 
FROM node:20

WORKDIR /app

COPY . .

RUN npm install
RUN npx prisma generate
RUN npm run build

EXPOSE 3000

# These are all commands to run the container
CMD ["node", "dist/index.js"]