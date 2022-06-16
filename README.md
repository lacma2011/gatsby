# basic docker setup for yarn packages with fixed IP


Build docker image when running for the first time:
>docker-compose build

Startup:
>docker-compose up

This will start two service containers: web (service "gatsby") and cypress


## Running, creating Gatsby projects

Console into running container:

    docker exec -it -u 1000:1000 $(docker ps -q -f "name=gatsby") /bin/bash

Go to existing project:

    cd gatsby_projects/my-gatsby-site

NPM install:

    npm install

Run develop/serve:

    npm run develop

You can see this gatsby project at:
>http://192.168.2.99:8000/


### New projects

Follow their online tutorials using the gatbsy-cli. They may suggest using node 16 with nvm:

    nvm use 16

After creating a new project, modify its package.json to make the scripting tasks (like "develop") use the same bound IP as the docker service. For example in gatsby_projects/my-gatsby-site/package.json:

      "develop": "gatsby develop -H 192.168.2.99",



## About fixed IP
Fixed IP for docker container is there for tools like cypress that test against a website.  The IP range of its docker network can conflict with another server in your host system.
