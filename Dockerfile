FROM formapro/nginx-php-fpm:latest

MAINTAINER Maksym Kotliar <kotlyar.maksim@gmail.com>

RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests openssl curl pkg-config libssl-dev libsslcommon2-dev && \
    apt-get install -y --no-install-recommends --no-install-suggests php7.2-mongodb php7.2-soap php7.2-xml php7.2-mbstring php7.2-curl php7.2-intl && \
    rm -rf /var/lib/apt/lists/*

ENV PAYUM_DEBUG 0
ENV NGINX_WEB_ROOT=/payum/public
ENV NGINX_PHP_FALLBACK=/index.php
ENV NGINX_PHP_LOCATION='^/index\.php(/|$)'

EXPOSE 80

ADD . /payum
WORKDIR /payum
