FROM node:latest

ENV NODE_ENV=development
WORKDIR /usr/src

###COPY . ./
RUN apt update -y
RUN apt upgrade -y
RUN apt install curl -y
RUN npm install -g gatsby-cli


#to avoid overwrites from volume bind with docker-compose, copy into root folder
COPY ./docker-entrypoint.sh /tmp/run-docker-entrypoint.sh

RUN ["chmod", "+x", "/tmp/run-docker-entrypoint.sh"]

ENTRYPOINT ["/tmp/run-docker-entrypoint.sh"]



SHELL ["/bin/bash", "--login", "-c"]

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN nvm install 16
RUN nvm use 16

