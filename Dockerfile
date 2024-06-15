FROM node:20-alpine3.18 AS react

WORKDIR /node/app

COPY package* ./
COPY src ./src/
COPY public ./public/

RUN npm ci

RUN npm run build

COPY --chown=node:node . .

# use a less privileged user to run the app
USER node 

EXPOSE 3000

CMD [ "npm", "start" ]
