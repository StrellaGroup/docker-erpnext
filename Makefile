.DEFAULT_GOAL := help

.PHONY: build clean-build start stop ssh getip

app = erpnext

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "build  To start building docker container"
	@echo "clean-build   Build from scratch without cache"
	@echo "start  Start up container build from build or clean-build"
	@echo "stop  Stop and delete container"
	@echo "ssh  Access container via ssh"
	@echo "getip   Get ip of container via docker inspect"

build:
	sudo docker build -t $(app) .

clean-build: 
	
	sudo docker build --no-cache -t $(app) .

start:
	
	sudo docker run --name $(app) -d $(app) tail -f /dev/null
	# sudo docker exec -it $(app) service mysqld restart
stop:
	
	sudo docker rm -f -v $(app)
ssh:
	
	sudo docker exec -it $(app) /bin/bash

getip:
	
	sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $(app)

