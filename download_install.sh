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
        apt install -y wget python3-pip dialog unzip
        pip3 install lastversion "requests<=2.29.0"
        mkdir -p /opt/$GITHUB_REPOSITORY
        cd /opt/$GITHUB_REPOSITORY
        wget  https://github.com/hiddify/hiddify-config/releases/download/v10.1.3/hiddify-config.zip -O hiddify-config.zip
        unzip -o hiddify-config.zip
        rm hiddify-config.zip
        rm -rf /opt/hiddify-config/other/warp
        sed -i 's/pip3 install -U hiddifypanel lastversion/pip3 install -U hiddifypanel==7.2.0/' /opt/hiddify-config/hiddify-panel/install.sh
        sed -i '/bash other\/warp\/status.sh/,/^fi$/d' /opt/hiddify-config/status.sh
        sed -i '/runsh \$1.sh other\/warp/d' /opt/hiddify-config/install.sh
        sudo sed -i 's/"address": "1.1.1.1"/"address": "127.0.0.53"/g' /opt/hiddify-config/xray/configs/06_outbounds.json.template
        sed -i '/sed -i "s|1.1.1.1|$dns_server|g"  configs\/06_outbounds.json/d' /opt/hiddify-config/xray/run.sh
        bash /opt/hiddify-config/install.sh
        # exit 0
# fi 


echo "/opt/hiddify-config/menu.sh">>~/.bashrc
echo "cd /opt/hiddify-config/">>~/.bashrc

read -p "Press any key to go  to menu" -n 1 key
cd /opt/$GITHUB_REPOSITORY
bash menu.sh
