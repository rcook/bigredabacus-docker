DOCKERENV := -e GEMINABOX_USERNAME=user -e GEMINABOX_PASSWORD=password

default:
	docker build -t rcook/geminabox .

run:
	docker run --name geminabox -d -p 4444:9292 $(DOCKERENV) -v $$PWD/data:/opt/geminabox/data:rw rcook/geminabox

