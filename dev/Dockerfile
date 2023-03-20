ARG PHP_IMG_TAG
ARG PHP_IMAGE
FROM ${PHP_IMAGE}:${PHP_IMG_TAG}

RUN apk update \
    && apk --no-cache --virtual add graphviz \
	&& rm /var/cache/apk/* \
    && install-php-extensions xdebug xhprof \
    && mkdir -m 777 /profiles
    
RUN sed -i "s/^;\?clear_env =.*/clear_env = no/" /usr/local/etc/php-fpm.d/www.conf

COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
COPY xhprof.ini /usr/local/etc/php/conf.d/docker-php-ext-xhprof.ini

EXPOSE 9003
