DATADIR := /docker-data/geminabox
DOCKERENV := -e GEMINABOX_USERNAME=user -e GEMINABOX_PASSWORD=password

default:
	docker build -t rcook/geminabox .

run:
	docker run --name geminabox -d -p 4444:9292 $(DOCKERENV) -v $(DATADIR):/opt/geminabox/data:rw rcook/geminabox

