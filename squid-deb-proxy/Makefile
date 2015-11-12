DATADIR := /docker-data/squid-deb-proxy

default:
	docker build -t rcook/squid-deb-proxy .

run:
	docker run -d -v $(DATADIR):/cachedir -p 8000:8000 rcook/squid-deb-proxy

