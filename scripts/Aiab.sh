#!bin/bash
cd ../AiaB

sudo cp -r ../AiaB/cord /root/
interface="eth0"
eth=$(ifconfig $interface | awk '/inet / {print $2}')
sudo sed -i 's/\(externalIp: "\)[^"]*/\1'"$eth"'/' sd-core-5g-values.yaml
ENABLE_GNBSIM=false DATA_IFACE=eth0 CHARTS=local make 5g-core

sudo apt update
sudo apt upgrade -y
sudo apt install -y make
sudo apt install -y gcc
sudo apt install -y g++
sudo apt install -y libsctp-dev lksctp-tools
sudo apt install -y iproute2
sudo snap install cmake --classic

