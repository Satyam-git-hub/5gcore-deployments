SHELL := /bin/bash
.PHONY: oai-5g-dep stop-oai-dep
oai-5g-dep:
	cd scripts/ && ./oai-dep-docker.sh
stop-oai-dep:
	cd scripts/ &&  ./stop-oai.sh
