# basic docker setup for yarn packages with fixed IP


Build docker image when running for the first time:
>docker-compose build

Startup:
>docker-compose up

This will start two service containers: web (service "gatsby") and cypress

Open browser to:
>http://192.168.2.99:3000/

## Running, creating Gatsby projects

Console into running container:

>docker exec -it $(docker ps -q -f "name=gatsby") /bin/bash

Go to existing project:
>cd gatsby_projects/my-gatsby-site

Run develop serve:
>npm run develop

You can see this gatsby project at:
>http://192.168.2.99:8000/


### Building a new project

Follow their online tutorials using the gatbsy-cli. For new projects, make the script runner (like "run develop") use the same bound IP as the docker service, by modifying the entry in package.json in the gatsby project. 

Example for "develop":

      "develop": "gatsby develop -H 192.168.2.99",


## About
Fixed IP for docker container is there for tools like cypress that test against a website.  The IP range of its docker network can conflict with another server in your host system.
