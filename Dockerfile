FROM node:16 as builder
RUN mkdir /app
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY ./package.json ./
COPY ./package-lock.json ./
RUN npm install &>/tmp/npmlog.txt
RUN npm install react-scripts@3.4.4 -g &>/dev/null
EXPOSE 3000
COPY . ./

CMD ["npm", "start"]
