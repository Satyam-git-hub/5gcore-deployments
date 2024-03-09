SHELL := /bin/bash



.PHONY: oai-5g-dep stop-oai-dep clean free5gc_upf

deps:
	cd scripts/ && ./ready -a


oai-5g-dep:
	cd scripts/ && ./oai-dep-docker.sh


stop-oai-dep:
	cd scripts/ &&  ./stop-oai.sh

free5gc_upf:
	cd free5gc-compse && docker compose pull && docker compose up -d

clean:
	cd free5gc-compse && docker compose down
