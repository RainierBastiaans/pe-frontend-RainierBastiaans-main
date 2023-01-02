FROM node:16 as builder
RUN apt-get update && apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker
RUN sudo mkdir /app
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY ./package.json ./
COPY ./package-lock.json ./
RUN sudo npm install &>/tmp/npmlog.txt
RUN sudo npm install react-scripts@3.4.1 -g &>/dev/null
EXPOSE 3000
COPY . ./

CMD ["npm", "start"]
