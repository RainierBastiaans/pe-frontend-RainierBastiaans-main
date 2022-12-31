FROM node:16 as builder
RUN mkdir /app
WORKDIR /app
COPY ./package.json ./
COPY ./package-lock.json ./
RUN npm install install &>/tmp/npmlog.txt
COPY . ./
EXPOSE 3000
CMD ["npm", "start"]