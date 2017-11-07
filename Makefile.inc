# Default shell
SHELL := /bin/bash

# Config
OUTPUT ?= $(shell pwd)/_site
NAME ?= $(basename "$PWD")
BASE_URL ?=

# Tools
MKDIR := mkdir -p
REMOVE := rm -rf
RUBY_PACKAGE_MANAGER := bundle
JS_PACKAGE_MANAGER := yarn

clean:
	$(REMOVE) $(OUTPUT)

dependencies:
	$(RUBY_PACKAGE_MANAGER) install
	$(JS_PACKAGE_MANAGER) install

build: dependencies
	@echo "Building ${NAME} ..."
	$(MKDIR) $(OUTPUT)
	$(JS_PACKAGE_MANAGER) build
ifdef BASE_URL
	$(RUBY_PACKAGE_MANAGER) exec jekyll build --destination $(OUTPUT) --baseurl ${BASE_URL}
else
	$(RUBY_PACKAGE_MANAGER) exec jekyll build --destination $(OUTPUT)
endif
	@echo "Generated ${NAME} "

start: dependencies
	$(JS_PACKAGE_MANAGER) start;
