default:
	docker build -t rcook/squid-deb-proxy .

run:
	docker run --name proxy --rm -v $$PWD/cachedir:/cachedir -p 8000:8000 rcook/squid-deb-proxy &

