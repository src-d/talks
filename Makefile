# Default shell
SHELL := /bin/bash

PROJECT := talks

# Config
OUTPUT ?= $(shell pwd)/_site/
TALKS = "infra-2017 machine-learning-2017 front-2017"

# CI: do not edit this
CI_REPOSITORY = https://github.com/src-d/ci.git
SHARED_PATH ?= $(shell pwd)
CI_PATH ?= $(SHARED_PATH)/.ci
MAKEFILE_MAIN := $(CI_PATH)/Makefile.main
$(MAKEFILE_MAIN):
	git clone --quiet --depth 1 $(CI_REPOSITORY) $(CI_PATH);
-include $(MAKEFILE_MAIN)

# Tools
REMOVE := rm -rf
CADDY := caddy

# Builds the project
build: clean-build
	$(MAKE) -C landing build NAME=landing OUTPUT=$(OUTPUT)
	for subTalk in "$(TALKS)"; do \
		$(MAKE) -C $$subTalk build NAME=$$subTalk OUTPUT=$(OUTPUT)/$$subTalk BASE_URL=/$$subTalk; \
	done;

# Cleans the build directory
clean-build:
	$(REMOVE) $(OUTPUT)

# Builds the project and serve it with caddy
serve: build
	cd $(OUTPUT) && $(CADDY) --port=8484 && cd -;
