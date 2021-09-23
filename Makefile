# Makefile for web platform
.DEFAULT_GOAL := help

build: ## Build PHP
	@docker-compose -f docker-compose.yml build php56 php73 php74 php80

build-dev: ## Build PHP with dev config
	@docker-compose -f docker-compose.yml build php56-dev php73-dev php74-dev php80-dev

build-dev-xdebug: ## Build PHP with XDebug 3
	@docker-compose -f docker-compose.yml build php56-dev-xdebug php73-dev-xdebug php74-dev-xdebug php80-dev-xdebug

push: ## Push PHP
	@docker-compose -f docker-compose.yml push php56 php73 php74 php80

push-dev: ## Push PHP with dev config
	@docker-compose -f docker-compose.yml push php56-dev php73-dev php74-dev php80-dev

push-dev-xdebug: ## Push PHP with XDebug 3
	@docker-compose -f docker-compose.yml push php56-dev-xdebug php73-dev-xdebug php74-dev-xdebug php80-dev-xdebug
