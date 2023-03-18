# Build
```
make build
```

# Get started:
```
docker pull doanbaanh/php-fpm:8.2
docker pull doanbaanh/php-fpm:8.2-dev

docker pull doanbaanh/php-fpm:8.1
docker pull doanbaanh/php-fpm:8.1-dev

docker pull doanbaanh/php-fpm:8.0
docker pull doanbaanh/php-fpm:8.0-dev

docker pull doanbaanh/php-fpm:7.4
docker pull doanbaanh/php-fpm:7.4-dev

docker pull doanbaanh/php-fpm:7.3
docker pull doanbaanh/php-fpm:7.3-dev

docker pull doanbaanh/php-fpm:5.6
docker pull doanbaanh/php-fpm:5.6-dev
```

# docker-compose.yml
```
version: "3.9"

x-logging: &default-logging
  driver: "json-file"
  options:
    max-size: "12m"
    max-file: "5"

services:
  php:
    image: doanbaanh/php-fpm:8.2-dev
    container_name: "php"
    environment:
      PHP_IDE_CONFIG: "serverName=php"
      XDEBUG_MODE: "develop,debug,profile,coverage"
    volumes:
      - "../:/usr/src:cached"
    working_dir: "/usr/src"
    restart: "unless-stopped"
    logging: *default-logging
```

# Included extensions:
```
@composer
amqp
apcu
bcmath
exif
gd
imagick
intl
mcrypt
memcache
memcached
mongodb
odbc
opcache
pdo_mysql
pdo_pgsql
pdo_sqlsrv
pcntl
redis
rdkafka
sockets
xsl
zip

# *-dev build
xdebug
xhprof
```
