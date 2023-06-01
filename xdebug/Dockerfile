ARG PHP_IMAGE
ARG PHP_IMAGE_TAG
FROM ${PHP_IMAGE}:${PHP_IMAGE_TAG}

RUN install-php-extensions xdebug \
	&& cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?clear_env =.*/clear_env = no/" /usr/local/etc/php-fpm.d/www.conf

COPY docker-php.ini /usr/local/etc/php/conf.d/docker-php.ini
COPY docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

EXPOSE 9003
