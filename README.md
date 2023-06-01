# Docker images
```
docker pull doanbaanh/php-fpm:8.2
docker pull doanbaanh/php-fpm:8.1
docker pull doanbaanh/php-fpm:8.0
docker pull doanbaanh/php-fpm:7.4
docker pull doanbaanh/php-fpm:7.3

# for arm64v8 (Apple Silicon)
docker pull doanbaanh/php-fpm-arm64v8:8.2
docker pull doanbaanh/php-fpm-arm64v8:8.1
docker pull doanbaanh/php-fpm-arm64v8:8.0
docker pull doanbaanh/php-fpm-arm64v8:7.4
docker pull doanbaanh/php-fpm-arm64v8:7.3

# with XDebug 3
docker pull doanbaanh/php-fpm:<PHP_VERSION>-dev
docker pull doanbaanh/php-fpm-arm64v8:<PHP_VERSION>-dev
```

# XDebug environment
```yaml
version: "3.9"

services:
  php:
    # or "doanbaanh/php-fpm-arm64v8:8.2-dev"
    image: "doanbaanh/php-fpm:8.2-dev"
    environment:
      PHP_IDE_CONFIG: "serverName=php"
      XDEBUG_MODE: "develop,debug,profile,coverage"
```

# Included extensions
```
@composer
amqp
apcu
bcmath
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
hash
iconv
imagick
intl
json
libxml
mbstring
mcrypt
memcache
memcached
mongodb
mysqlnd
odbc
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_pgsql
pdo_sqlite
pdo_sqlsrv
Phar
posix
random
rdkafka
readline
redis
Reflection
session
SimpleXML
sockets
sodium
SPL
sqlite3
standard
tokenizer
xhprof
xml
xmlreader
xmlwriter
xsl
Zend OPcache
zip
zlib
# xdebug - in dev images
```
