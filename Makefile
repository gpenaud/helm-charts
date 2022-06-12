# ---------------------------------------------------------------------------- #
# cluster
# ---------------------------------------------------------------------------- #

## Checks that helm charts are correctly formatted
lint:
	helm lint sources/*

## Generates tgz from helm charts sources
package:
	helm package sources/*

## Updates index.yaml for charts indexing
index:
	helm repo index --url https://gpenaud.github.io/helm-charts/ .

## Add the chart repository locally
add:
	helm repo add gpenaud https://gpenaud.github.io/helm-charts/

## Checks that helm charts are correctly formatted
process: package index 

# ---------------------------------------------------------------------------- #
# 																																						 #
# ---------------------------------------------------------------------------- #

.ONESHELL:
.SILENT:
SHELL := /bin/bash

## permanent variables
PROJECT ?= github.com/gpenaud/helm-charts

## Colors
BOLD 							= $(shell tput bold)
UNDERLINE					= $(shell tput smul)
NOT_UNDERLINE			= $(shell tput rmul)
COLOR_RESET				= $(shell tput sgr0)
COLOR_ERROR				= $(shell tput setaf 1)
COLOR_COMMENT			= $(shell tput setaf 3)

## display this help text
help:
	@printf "\n"
	@printf "${BOLD}Makefile for project ${UNDERLINE}${PROJECT}${NOT_UNDERLINE}${COLOR_RESET}\n"
	@printf "\n"
	@printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	@printf " make package\n\n"
	@printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	@awk '/^[a-zA-Z\-_0-9@]+:/ { \
				helpLine = match(lastLine, /^## (.*)/); \
				helpCommand = substr($$1, 0, index($$1, ":")); \
				helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
				printf " ${COLOR_INFO}%-19s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
		{ lastLine = $$0 }' $(MAKEFILE_LIST)
	@printf "\n"
