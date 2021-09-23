FROM doanbaanh/php-fpm:8.0

LABEL maintainer="doanbaanh@gmail.com"

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?date\.timezone =.*/date\.timezone = Europe\/Moscow/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?max_execution_time =.*/max_execution_time = 360/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?memory_limit =.*/memory_limit = -1/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?post_max_size =.*/post_max_size = 512M/" /usr/local/etc/php/php.ini \
	&& sed -i "s/^;\?upload_max_filesize =.*/upload_max_filesize = 512M/" /usr/local/etc/php/php.ini
