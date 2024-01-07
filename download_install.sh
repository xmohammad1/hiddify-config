#!/bin/sh
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi
export DEBIAN_FRONTEND=noninteractive
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

echo "we are going to download needed files:)"
GITHUB_REPOSITORY=hiddify-config
GITHUB_USER=hiddify
GITHUB_BRANCH_OR_TAG=main

# if [ ! -d "/opt/$GITHUB_REPOSITORY" ];then
apt update
apt upgrade -y
apt install -y curl unzip
# pip3 install lastversion "requests<=2.29.0"
# pip install lastversion "requests<=2.29.0"
mkdir -p /opt/$GITHUB_REPOSITORY
cd /opt/$GITHUB_REPOSITORY
curl -L -o hiddify-config.zip https://github.com/hiddify/hiddify-config/releases/latest/download/hiddify-config.zip
unzip -o hiddify-config.zip
rm hiddify-config.zip
sed -i 's/ "requests<=2.29.0"//g' /opt/hiddify-config/hiddify-panel/install.sh
#sed -i 's/--version 1.8.4/--version 1.8.6/g' /opt/hiddify-config/xray/install.sh
#sed -i 's/--version 1.8.4/--version 1.8.6/g' /opt/hiddify-config/install.sh
sed -i ':a;N;$!ba;s/"forbidden_sites",\n\s* "protocol": "blackhole"/"forbidden_sites", "protocol": "blackhole"/' /opt/hiddify-config/xray/configs/06_outbounds.json.template
sed -i 's/"8.8.8.8",/"8.8.4.4",/g' /opt/hiddify-config/xray/configs/02_dns.json.template
bash install.sh
# exit 0
# fi

sed -i "s|cd /opt/hiddify-manager/||g" ~/.bashrc
sed -i "s|/opt/hiddify-manager/menu.sh||g" ~/.bashrc
echo "cd /opt/hiddify-manager/">>~/.bashrc
echo "/opt/hiddify-manager/menu.sh">>~/.bashrc

read -p "Press any key to go  to menu" -n 1 key
cd /opt/$GITHUB_REPOSITORY
bash menu.sh
