FROM node:19-alpine

WORKDIR /home

RUN npm install -g @vue/cli

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080
CMD ["npm", "run", "serve"]