FROM doanbaanh/php-fpm:8

LABEL maintainer="doanbaanh@gmail.com"

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?date\.timezone =.*/date\.timezone = Europe\/Moscow/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?memory_limit =.*/memory_limit = 512M/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?max_execution_time =.*/max_execution_time = 120/" /usr/local/etc/php/php.ini \
	&& install-php-extensions xdebug

COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
