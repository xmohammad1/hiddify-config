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
        curl -L -o hiddify-config.zip https://github.com/hiddify/hiddify-config/releases/download/v10.1.3/hiddify-config.zip
        unzip -o hiddify-config.zip
        rm hiddify-config.zip
