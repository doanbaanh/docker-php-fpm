FROM php:7.4-fpm-alpine

LABEL maintainer="doanbaanh@gmail.com"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk update && apk --no-cache --virtual add \
		supervisor \
	&& rm /var/cache/apk/* \
	&& chmod +x /usr/local/bin/install-php-extensions \
	&& sync \
	&& install-php-extensions \
		@composer \
		amqp \
		apcu \
		bcmath \
		exif \
		gd \
		imagick \
		intl \
		mcrypt \
		mongodb \
		opcache \
		pdo_mysql \
		pdo_pgsql \
		redis \
		sockets \
		zip \
	&& cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

COPY ./supervisord.conf /etc/supervisord.conf

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
	&& install-php-extensions xdebug

COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
