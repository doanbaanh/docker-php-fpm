# Get started:
```
docker pull doanbaanh/php-fpm:5.6
docker pull doanbaanh/php-fpm:5.6-xdebug

docker pull doanbaanh/php-fpm:7.4
docker pull doanbaanh/php-fpm:7.4-xdebug

docker pull doanbaanh/php-fpm:8.0
docker pull doanbaanh/php-fpm:8.0-xdebug
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
mongodb
opcache
pdo_mysql
pdo_pgsql
redis
sockets
zip
```

# Example XDebug configuration for VSCode

### <workspace_directory>/.vscode/launch.json
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
                "/var/www": "${workspaceFolder}/workspace"
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