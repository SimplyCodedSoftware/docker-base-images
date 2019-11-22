FROM simplycodedsoftware/debian:latest

RUN apt-get update -qq \
    && apt-get install nginx --no-install-recommends -yqq \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ADD nginx.conf /etc/nginx
ADD app.conf /etc/nginx/sites-available/app.conf
ADD prepare-app.sh /data/entrypoint.d/prepare-app.sh

RUN ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app \
    && chmod +x /data/entrypoint.d/prepare-app.sh \
    && rm -f /etc/nginx/sites-available/default \
    && rm -f /etc/nginx/sites-enabled/default

CMD ["nginx"]
