
APP_NAME ?= prometheus-exporter-aws
DOCKER_TAG ?= latest
DOCKER_HUB_USER ?= 
DOCKER_HUB_REPO ?= $(DOCKER_HUB_USER)/$(APP_NAME)

docker-build:
	docker build -t $(APP_NAME):$(DOCKER_TAG) .

docker-hub-push:
	docker tag $(APP_NAME):$(DOCKER_TAG) ${DOCKER_HUB_REPO}:$(DOCKER_TAG)
	docker tag $(APP_NAME):$(DOCKER_TAG) ${DOCKER_HUB_REPO}:$(shell git rev-parse --short HEAD)
	docker push ${DOCKER_HUB_REPO}:$(DOCKER_TAG)
	docker push ${DOCKER_HUB_REPO}:$(shell git rev-parse --short HEAD)
