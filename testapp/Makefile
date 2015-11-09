default:
	docker build -t rcook/testapp .

run:
	docker run --name testapp --link geminabox:geminabox -d -p 3333:80 -e SECRET_KEY_BASE=secretkey rcook/testapp

