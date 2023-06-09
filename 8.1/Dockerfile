FROM php:8.1-fpm-alpine

LABEL maintainer="doanbaanh@gmail.com"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk update && apk --no-cache --virtual add \
		bash \
		git \
		grep \
		nano \
		parallel \
		sudo \
		supervisor \
		jq xq yq \
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
		memcache \
		memcached \
		mongodb \
		opcache \
		pdo_mysql \
		pdo_pgsql \
		pcntl \
		redis \
		sockets \
		zip \
	&& cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?date\.timezone =.*/date\.timezone = Europe\/Moscow/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?max_execution_time =.*/max_execution_time = 180/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?memory_limit =.*/memory_limit = 128M/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?post_max_size =.*/post_max_size = 64M/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?upload_max_filesize =.*/upload_max_filesize = 64M/" /usr/local/etc/php/php.ini

CMD ["php-fpm", "-R"]
