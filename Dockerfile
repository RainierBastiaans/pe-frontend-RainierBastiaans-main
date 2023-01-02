FROM node:16 as builder
RUN mkdir /app
WORKDIR /app
COPY ./package.json ./
COPY ./package-lock.json ./
RUN npm install &>/tmp/npmlog.txt
EXPOSE 3000
COPY . ./

CMD ["npm", "start"]
