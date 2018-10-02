IMAGENAME=deep-learning

# docker command -----

.PHONY: all
all: build run ## build docker image and run docker container.

.PHONY: build
build: ## build docker image.
	docker build -t $(IMAGENAME) --no-cache=true ./

.PHONY: run
run: ## run docker comtainer.
	docker run --name $(IMAGENAME) --rm -it -v $(shell pwd):/usr/src/app $(IMAGENAME) bash
.PHONY: exec ## execute docker container.
exec: ## exec docker container.
	docker exec -it $(IMAGENAME) /bin/bash

.PHONY: stop
stop: ## stop container.
	docker stop $(IMAGENAME)

.PHONY: rm
rm: ## remove docker container.
	docker rm $(IMAGENAME)

.PHONY: rmi
rmi: ## remove docker image.
	docker rmi $(IMAGENAME)

.PHONY: clean
clean: stop; rm; rmi ## clean up docker image and container.

# help command -----
help: ## show help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

