#!/bin/bash

# Change directory to oai-5gcore/oai-cn5g-fed/docker-compose/
cd ../oai-5gcore/oai-cn5g-fed/docker-compose/

# Stop and remove containers defined in docker-compose-gnbsim-ebpf.yaml
docker compose -f docker-compose-gnbsim-ebpf.yaml down

# Stop and remove containers defined in docker-compose-basic-nrf-ebpf.yaml
docker compose -f docker-compose-basic-nrf-ebpf.yaml down
