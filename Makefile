
# Check at https://developer.garmin.com/downloads/connect-iq/sdks/sdks.xml
VERSION := 3.1.9-2020-06-24-1cc9d3a70

all: build 

pull:
	docker pull kalemena/connectiq:$(VERSION)

build:
	@echo "+++ Building docker image +++"
	docker pull scottyhardy/docker-remote-desktop:ubuntu-18.04
	docker build --build-arg VERSION=$(VERSION) -t asienski/connectiq:$(VERSION) .
	docker tag asienski/connectiq:$(VERSION) asienski/connectiq:latest

console:
	bash ./run.sh

eclipse:
	COMMAND=/opt/eclipse/eclipse bash ./run.sh
