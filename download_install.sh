#!/bin/sh
if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi
export DEBIAN_FRONTEND=noninteractive

echo "we are going to download needed files:)"
GITHUB_REPOSITORY=hiddify-config
GITHUB_USER=hiddify
GITHUB_BRANCH_OR_TAG=main

# if [ ! -d "/opt/$GITHUB_REPOSITORY" ];then
apt update
#apt upgrade -y
apt -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

apt install -y curl unzip
# pip3 install lastversion "requests<=2.29.0"
# pip install lastversion "requests<=2.29.0"
mkdir -p /opt/$GITHUB_REPOSITORY
cd /opt/$GITHUB_REPOSITORY
curl -L -o $GITHUB_REPOSITORY.zip https://github.com/hiddify/$GITHUB_REPOSITORY/releases/latest/download/$GITHUB_REPOSITORY.zip
unzip -o $GITHUB_REPOSITORY.zip
rm $GITHUB_REPOSITORY.zip
sed -i 's/ "requests<=2.29.0"//g' /opt/hiddify-config/hiddify-panel/install.sh
# sed -i 's/--version 1.8.4/--version 1.8.6/g' /opt/hiddify-config/xray/install.sh
# sed -i 's/--version 1.8.4/--version 1.8.6/g' /opt/hiddify-config/install.sh
sed -i ':a;N;$!ba;s/"forbidden_sites",\n\s* "protocol": "blackhole"/"forbidden_sites", "protocol": "blackhole"/' /opt/hiddify-config/xray/configs/06_outbounds.json.template
sed -i 's/"8.8.8.8",/"8.8.4.4",/g' /opt/hiddify-config/xray/configs/02_dns.json.template
bash install.sh
# exit 0
# fi

sed -i "s|/opt/$GITHUB_REPOSITORY/menu.sh||g" ~/.bashrc
sed -i "s|cd /opt/$GITHUB_REPOSITORY/||g" ~/.bashrc
echo "/opt/$GITHUB_REPOSITORY/menu.sh" >>~/.bashrc
echo "cd /opt/$GITHUB_REPOSITORY/" >>~/.bashrc

read -p "Press any key to go  to menu" -n 1 key
cd /opt/$GITHUB_REPOSITORY
bash menu.sh
