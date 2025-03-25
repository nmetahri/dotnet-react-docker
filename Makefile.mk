.DEFAULT_GOAL := help
REQUIRED_ENV_VARS = BACKEND_PATH FRONTEND_PATH PROJECT_NAME SQL_CONNECTION_STRING

help:
	@echo "Usage: make <target>"
	@echo "Available targets:"
	@awk 'BEGIN {FS = ":.*?## "}; /^[a-zA-Z_-]+:.*?## / {printf "%-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

stop: ## Stop only Dockers services
	@echo "\n==> Stopping docker container"
	$(DC) stop

do: ## Stop and Remove all Docker containers  + services + networks.
	@echo "\n==> Removing docker container"
	$(DC) down --remove-orphans

up: check-env-vars ## Build and start Docker containers.
	@echo "\n==> Docker container building and starting ..."
	$(DC) up --build -d

exfront: ## Enter the front container with normal user.
	@echo "\n==> Entering front container ..."
	$(DC) exec -it frontend /bin/bash

exback: ## Enter the container with normal user.
	@echo "\n==> Entering backend container ..."
	$(DC) exec -it backend /bin/bash

exafront: ## Enter the container with root user.
	@echo "\n==> Entering front container ..."
	$(DC) exec -it --user=root frontend /bin/bash

exaback: ## Enter the container with root user.
	@echo "\n==> Entering backend container ..."
	$(DC) exec -it --user=root backend /bin/bash

back-logs: ## Show the logs of the backend container.
	@echo "\n==> Showing backend logs ..."
	$(DC) logs -f backend

front-logs: ## Show the logs of the frontend container.
	@echo "\n==> Showing frontend logs ..."
	$(DC) logs -f frontend

check-env-vars:
	@echo "Checking if required environment variables are set..."
	@$(foreach var,$(REQUIRED_ENV_VARS),\
		$(if $(value $(var)),,$(error Missing environment variable: $(var))))