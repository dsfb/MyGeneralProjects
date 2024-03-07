FROM node:16-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node package*.json ./

USER node

RUN ls -la /home/node/app

RUN npm install serverless

RUN npm install serverless-offline

RUN npm install mongodb

COPY --chown=node:node . .

EXPOSE 3000

CMD ["npm", "run", "start"]
