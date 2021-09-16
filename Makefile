.SILENT:

.PHONY: build push run stop shell logf

TAG := kadeeke/xmrig-proxy

build:
	docker build -t $(TAG) .

push:
	docker push $(TAG)

CONTAINER_NAME := xmrig-proxy
CONFIG := /var/lib/xmrig/proxy.json

run:
	docker run --rm -it --name $(CONTAINER_NAME) -v $(PWD)/config.json:$(CONFIG) $(TAG) -c $(CONFIG)

stop:
	docker stop $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) /bin/sh

logf:
	docker logs -f $(CONTAINER_NAME)