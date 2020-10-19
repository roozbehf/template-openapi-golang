# 
# Makefile for validating and generating Golang code
# based on OpenAPI 3.0 specs
# 

include ./MANIFEST

OPENAPI_DIR=openapi
OPENAPI_FILE=$(OPENAPI_DIR)/server.yml
OPENAPI_CONFIG_FILE=$(OPENAPI_DIR)/config.yml

OPENAPI_GEN_VERSION=v5.0.0-beta2
OPENAPI_DOCKER_CMD=docker run --rm -v $${PWD}:/local openapitools/openapi-generator-cli:$(OPENAPI_GEN_VERSION)
OPENAPI_GEN_DIR=server

# --- OpenAPI
api-help-config:
	@$(OPENAPI_DOCKER_CMD) \
		config-help -g go
	@$(OPENAPI_DOCKER_CMD) \
		config-help -g go-server

api-validate:
	@$(OPENAPI_DOCKER_CMD) \
		validate \
    	-i /local/$(OPENAPI_FILE)

api-generate: api-validate
	@$(OPENAPI_DOCKER_CMD) \
		generate \
		-g go-server -o /local/$(OPENAPI_GEN_DIR) \
		-c /local/$(OPENAPI_CONFIG_FILE) \
		--package-name $(PACKAGE_NAME) \
		--api-name-suffix API \
    	-i /local/$(OPENAPI_FILE)
	@echo cleaning up imports...
	@cd $(OPENAPI_GEN_DIR); goimports -w .; cd ..

