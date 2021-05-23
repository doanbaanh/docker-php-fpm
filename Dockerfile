FROM php:7.4-fpm-alpine

LABEL maintainer="doanbaanh@gmail.com"

RUN apk update && apk --no-cache --virtual add \
		$PHPIZE_DEPS \
		supervisor \
	&& rm /var/cache/apk/*

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions \
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
		zip
