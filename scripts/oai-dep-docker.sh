#!/bin/bash

# Change directory to oai-5gcore/oai-cn5g-fed/docker-compose/
cd ../oai-5gcore/oai-cn5g-fed/docker-compose/

# Start containers defined in docker-compose-basic-nrf-ebpf.yaml
docker compose -f docker-compose-basic-nrf-ebpf.yaml up -d

# Wait for containers to be healthy
echo "Waiting for containers to be healthy..."
until docker compose -f docker-compose-basic-nrf-ebpf.yaml ps | grep -v "healthy"; do
    sleep 1
done

# Start containers defined in docker-compose-gnbsim.yaml
docker compose -f docker-compose-gnbsim-ebpf.yaml up -d
