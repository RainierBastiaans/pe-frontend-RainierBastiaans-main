FROM node:16 as builder
RUN mkdir /app
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY ./package.json ./
COPY ./package-lock.json ./
RUN sudo npm install &>/tmp/npmlog.txt
RUN sudo npm install react-scripts@3.4.1 -g &>/dev/null
EXPOSE 3000
COPY . ./

CMD ["npm", "start"]
