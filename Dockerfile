FROM node:16 as builder
RUN mkdir /app
WORKDIR /app
COPY ./pe-frontend-RainierBastiaans-main/package.json ./
COPY ./pe-frontend-RainierBastiaans-main/package-lock.json ./
RUN npm ci
COPY . ./
EXPOSE 3000
CMD ["npm", "start"]