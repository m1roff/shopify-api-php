DOCKER_COMPOSE = docker
DOCKER_TAG = shopify-php-api
DOCKERFILE_PATH = .docker/Dockerfile
DOCKER_RUN = docker run --rm -v $(PWD):/app -t $(DOCKER_TAG)

GREEN := "\033[32m"
RESET := "\033[0m"

.PHONY: help build test test-coverage composer-install composer-update

all: help

# This will output the help for each task. thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-z0-9A-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)



build: ## Building a Docker image
	@echo ${GREEN}Building Docker image...${RESET}
	$(DOCKER_COMPOSE) build --file $(DOCKERFILE_PATH) -t $(DOCKER_TAG) .

test: ## Running tests
	@echo ${GREEN}Running tests...${RESET}
	$(DOCKER_RUN) ./vendor/bin/phpunit

test-coverage: ## Running tests with coverage
	@echo ${GREEN}Running tests with coverage...${RESET}
	$(DOCKER_RUN) ./vendor/bin/phpunit --coverage-text

composer-install: ## Composer. Installing dependencies
	@echo ${GREEN}Installing dependencies...${RESET}
	$(DOCKER_RUN) composer install

composer-update: ## Composer. Updating dependencies
	@echo ${GREEN}Updating dependencies...${RESET}
	$(DOCKER_RUN) composer update