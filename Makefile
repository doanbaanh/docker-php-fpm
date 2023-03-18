.DEFAULT_GOAL := help

ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(ARGS):;@:)

help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build PHP
ifneq (,${ARGS})
	@docker compose -f docker-compose.yml build ${ARGS}
else
	@docker compose -f docker-compose.yml build
endif

build-dev: ## Build PHP images (xDebug + XHProf)
ifneq (,${ARGS})
	@docker compose -f docker-compose.dev.yml build ${ARGS}
else
	@docker compose -f docker-compose.dev.yml build
endif

push: ## Push PHP
ifneq (,${ARGS})
	@docker compose -f docker-compose.yml push ${ARGS}
else
	@docker compose -f docker-compose.yml push
endif

push-dev: ## Push PHP images (xDebug + XHProf)
ifneq (,${ARGS})
	@docker compose -f docker-compose.yml push ${ARGS}
else
	@docker compose -f docker-compose.yml push
endif
