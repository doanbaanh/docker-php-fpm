# Makefile for web platform
.DEFAULT_GOAL := help

# arguments
ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(ARGS):;@:)

help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build PHP
ifneq (,${ARGS})
	@docker-compose -f docker-compose.yml build --no-cache ${ARGS}
else
	@docker-compose -f docker-compose.yml build --no-cache php56 php73 php74 php80 php81
endif

build-dev: ## Build PHP with dev config
	@docker-compose -f docker-compose.yml build --no-cache php56-dev php73-dev php74-dev php80-dev php81-dev

build-dev-xdebug: ## Build PHP with XDebug 3
	@docker-compose -f docker-compose.yml build --no-cache php56-dev-xdebug php73-dev-xdebug php74-dev-xdebug php80-dev-xdebug php81-dev-xdebug


push: ## Push PHP
ifneq (,${ARGS})
	@docker-compose -f docker-compose.yml push ${ARGS}
else
	@docker-compose -f docker-compose.yml push php56 php73 php74 php80 php81
endif

push-dev: ## Push PHP with dev config
	@docker-compose -f docker-compose.yml push php56-dev php73-dev php74-dev php80-dev php81-dev

push-dev-xdebug: ## Push PHP with XDebug 3
	@docker-compose -f docker-compose.yml push php56-dev-xdebug php73-dev-xdebug php74-dev-xdebug php80-dev-xdebug php81-dev-xdebug
