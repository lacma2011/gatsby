# basic docker setup for yarn packages with fixed IP


Build docker image when running for the first time:
>docker-compose build

Startup:
>docker-compose up

This will start two service containers: web (service "frontend") and cypress

Open browser to:
>http://192.168.2.99:3000/


## About
Fixed IP for docker container is there for tools like cypress that test against a website.  The IP range of its docker network can conflict with another server in your host system.

yarn.lock can optionally be added but it may install OS-specific libraries.