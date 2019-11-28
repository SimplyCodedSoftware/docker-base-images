FROM simplycodedsoftware/debian:latest

RUN curl -sL https://deb.nodesource.com/setup_13.x -o nodesource_setup.sh && bash nodesource_setup.sh && rm -rf nodesource_setup.sh
RUN apt-get update && apt-get install nodejs && cleanup