.DEFAULT_GOAL := help

ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(ARGS):;@:)

help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build PHP images
ifneq (,${ARGS})
	@docker compose -f docker-compose.yml build ${ARGS}
else
	@docker compose -f docker-compose.yml build
endif

build-arm: ## Build PHP images (For Apple Silicon)
ifneq (,${ARGS})
	@docker compose -f docker-compose.arm64v8.yml build ${ARGS}
else
	@docker compose -f docker-compose.arm64v8.yml build
endif

pull: ## Pull PHP images
ifneq (,${ARGS})
	@docker compose -f docker-compose.yml pull ${ARGS}
else
	@docker compose -f docker-compose.yml pull
endif

pull-arm: ## Pull PHP images (For Apple Silicon)
ifneq (,${ARGS})
	@docker compose -f docker-compose.arm64v8.yml pull ${ARGS}
else
	@docker compose -f docker-compose.arm64v8.yml pull
endif

push: ## Push PHP images
ifneq (,${ARGS})
	@docker compose -f docker-compose.yml push ${ARGS}
else
	@docker compose -f docker-compose.yml push
endif

push-arm: ## Push PHP images (For Apple Silicon)
ifneq (,${ARGS})
	@docker compose -f docker-compose.arm64v8.yml push ${ARGS}
else
	@docker compose -f docker-compose.arm64v8.yml push
endif
