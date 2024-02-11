#!/bin/bash

echo "Downloading $@"

if [[ " $@ " == *" release "* ]]; then
    sudo bash -c "$(curl -sLfo- https://raw.githubusercontent.com/xmohammad1/hiddify-config/10.5.50/download_install.sh)"
    exit $?
fi

mkdir -p /tmp/hiddify/
curl -sL -o /tmp/hiddify/hiddify_installer.sh https://raw.githubusercontent.com/hiddify/Hiddify-Manager/main/common/hiddify_installer.sh
curl -sL -o /tmp/hiddify/utils.sh https://raw.githubusercontent.com/hiddify/Hiddify-Manager/main/common/utils.sh
chmod +x /tmp/hiddify/hiddify_installer.sh
chmod +x /tmp/hiddify/utils.sh
bash /tmp/hiddify/hiddify_installer.sh $@
