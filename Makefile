ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(ARGS):;@:)

.DEFAULT_GOAL := help
help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build images
ifneq (,${ARGS})
	@docker build \
		--no-cache \
		--tag doanbaanh/php-fpm:${ARGS} \
		--build-arg PHP_IMAGE=php \
		--build-arg PHP_IMAGE_TAG=${ARGS} \
		.
	@docker build \
		--no-cache \
		--tag doanbaanh/php-fpm:${ARGS}-dev \
		--build-arg PHP_IMAGE=doanbaanh/php-fpm \
		--build-arg PHP_IMAGE_TAG=${ARGS} \
		./xdebug
endif

build-arm: ## Build images (for ARM64V8)
ifneq (,${ARGS})
	@docker build \
		--no-cache \
		--tag doanbaanh/php-fpm-arm64v8:${ARGS} \
		--build-arg PHP_IMAGE=arm64v8/php \
		--build-arg PHP_IMAGE_TAG=${ARGS} \
		.
	@docker build \
		--no-cache \
		--tag doanbaanh/php-fpm-arm64v8:${ARGS}-dev \
		--build-arg PHP_IMAGE=doanbaanh/php-fpm-arm64v8 \
		--build-arg PHP_IMAGE_TAG=${ARGS} \
		./xdebug
endif

push: ## Push images
	@docker push \
		--all-tags \
		doanbaanh/php-fpm

push-arm: ## Push images (for ARM64V8)
	@docker push \
		--all-tags \
		doanbaanh/php-fpm-arm64v8
