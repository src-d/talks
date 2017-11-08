PROJECT := talks

# CI: do not edit this
CI_REPOSITORY = https://github.com/src-d/ci.git
SHARED_PATH ?= $(shell pwd)
CI_PATH ?= $(SHARED_PATH)/.ci
MAKEFILE_MAIN := $(CI_PATH)/Makefile.main
$(MAKEFILE_MAIN):
	git clone --quiet --depth 1 $(CI_REPOSITORY) $(CI_PATH);
-include $(MAKEFILE_MAIN)
