SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

include $(SELF_DIR)/.env
export
include $(SELF_DIR)/Makefile.mk

DC=docker compose -p${PROJECT_NAME} -f ./docker-compose.yml --env-file=.env