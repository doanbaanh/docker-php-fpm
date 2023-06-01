ARG PHP_IMAGE
ARG PHP_IMAGE_TAG
FROM ${PHP_IMAGE}:${PHP_IMAGE_TAG}-fpm-alpine

ENV TZ=Europe/Moscow

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk update \
	&& apk --no-cache --virtual add \
		git \
		graphviz \
		htop \
		mc \
		nano \
		supervisor \
		tzdata \
		vim \
	&& rm /var/cache/apk/*

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
		memcache \
		memcached \
		mongodb \
		odbc \
		opcache \
		pdo_mysql \
		pdo_pgsql \
		pdo_sqlsrv \
		pcntl \
		redis \
		rdkafka \
		sockets \
		xhprof \
		xsl \
		zip \
	&& cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

COPY docker-php.ini /usr/local/etc/php/conf.d/docker-php.ini
COPY docker-php-ext-xhprof.ini /usr/local/etc/php/conf.d/docker-php-ext-xhprof.ini
