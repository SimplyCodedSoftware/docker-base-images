FROM simplycodedsoftware/php:8.1

RUN apt-get update -qq \
    && apt-get install nginx --no-install-recommends -yqq \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ADD app.conf /etc/nginx/sites-available/app.conf
ADD prepare-nginx.sh /data/entrypoint.d/1_prepare-nginx.sh
ADD programs.conf /etc/supervisor/conf.d/programs.conf

RUN rm -rf /etc/nginx/sites-enabled/app \
    && ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app \
    && chmod +x /data/entrypoint.d/1_prepare-nginx.sh \
    && rm -f /etc/nginx/sites-available/default \
    && rm -f /etc/nginx/sites-enabled/default

CMD ["/usr/local/bin/start-supervisor"]