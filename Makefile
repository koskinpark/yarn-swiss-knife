IMAGE_FRONT ?= iberdinsky/yarn-swiss-knife

# Get local yarn cache dir
# if yarn installed locally.
YARN_VERSION := $(shell yarn --version 2>/dev/null)
ifdef YARN_VERSION
YARN_CACHE= -v $(shell yarn cache dir):/root/.yarn-cache
else
YARN_CACHE=
endif


front = docker run --rm  -it -v $(shell pwd):/app $(YARN_CACHE) $(IMAGE_FRONT) ${1}

all: | run_once

run_once:
	make front
	make clean

front:
	@echo "Building front tasks..."
	# docker pull $(IMAGE_FRONT)
	$(call front)

exec:
	$(call front, sh)

task:
	$(call front, yarn run)

clean:
	rm -rf node_modules
	rm -rf yarn.lock
