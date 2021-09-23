FROM doanbaanh/php-fpm:8.0-dev

LABEL maintainer="doanbaanh@gmail.com"

RUN install-php-extensions xdebug

COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
