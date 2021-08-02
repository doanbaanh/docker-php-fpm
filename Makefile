# Makefile for web platform
.DEFAULT_GOAL := help

build: ## Build PHP
	@docker-compose -f docker-compose.yml build php5 php7 php8

build-xdebug: ## Build PHP with XDebug 3
	@docker-compose -f docker-compose.yml build php5-xdebug php7-xdebug php8-xdebug

push: ## Push PHP
	@docker-compose -f docker-compose.yml push php5 php7 php8

push-xdebug: ## Push PHP with XDebug 3
	@docker-compose -f docker-compose.yml push php5-xdebug php7-xdebug php8-xdebug
