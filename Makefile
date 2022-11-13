VERSION=v0.0.1 # latest
IMAGE_NAME=k8s-static-site
IMAGE_REPO=ghcr.io/ericbutera # microk8s=localhost:32000
IMAGE_TAG=${VERSION}

.DEFAULT_GOAL := help

.PHONY: help
help: ## Help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: image-build
image-build: ## Build docker image
	docker build --env-file=.env -t ${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG} .

.PHONY: image-push
image-push: ## Push docker image
	docker push ${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG}

.PHONY: image-run
image-run: ## Run docker image
	docker run \
	--env-file=.env \
	--rm \
	-p 8080:8080 \
	-v "${PWD}":"/web" \
	${IMAGE_REPO}/${IMAGE_NAME}:${IMAGE_TAG}
