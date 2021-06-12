FROM php:5.6-fpm-alpine

LABEL maintainer="doanbaanh@gmail.com"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk update && apk --no-cache --virtual add \
		git \
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
	&& cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?date\.timezone =.*/date\.timezone = Europe\/Moscow/" /usr/local/etc/php/php.ini

COPY ./supervisord.conf /etc/supervisord.conf
