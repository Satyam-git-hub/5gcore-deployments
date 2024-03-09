#!bin/bash

cd ../open5gs-docker-compose/base
docker build --no-cache --force-rm -t docker_open5gs .

cd ../ueransim
docker build --no-cache --force-rm -t docker_ueransim .

cd ..
set -a
source .env
sudo ufw disable
sudo sysctl -w net.ipv4.ip_forward=1

docker compose -f sa-deploy.yaml build

# UERANSIM gNB (RF simulated)
docker compose -f nr-gnb.yaml up -d
sed -i "s/UE1_KI/465B5CE8B199B49FAA5F0A2EE238A6BC/g; s/UE1_OP/E8ED289DEBA952E4283B54E88E6183CA/g; s/OP/OPC/g" ../open5gs-docker-compose/ueransim
docker compose -f nr-ue.yaml up -d
