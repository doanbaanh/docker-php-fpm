# Get started:
```
docker pull doanbaanh/php-fpm:5.6
docker pull doanbaanh/php-fpm:5.6-dev
docker pull doanbaanh/php-fpm:5.6-dev-xdebug

docker pull doanbaanh/php-fpm:7.4
docker pull doanbaanh/php-fpm:7.4-dev
docker pull doanbaanh/php-fpm:7.4-dev-xdebug

docker pull doanbaanh/php-fpm:8.0
docker pull doanbaanh/php-fpm:8.0-dev
docker pull doanbaanh/php-fpm:8.0-dev-xdebug
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
opcache
pdo_mysql
pdo_pgsql
pcntl
redis
sockets
zip
```

# Example XDebug configuration for VSCode

### <workspace_folder>/.vscode/launch.json
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for XDebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/usr/src": "${workspaceFolder}/workspace"
            },
            "ignore": [
                "**/vendor/**/*.php"
            ],
            "xdebugSettings": {
                "max_children": 10000,
                "max_data": 10000,
                "show_hidden": 1
            }
        }
    ]
}
```