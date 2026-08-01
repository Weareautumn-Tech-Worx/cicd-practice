FROM node:20-alpine

WORKDIR /CICD-PRACTICE

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "app"]