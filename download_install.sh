#!/bin/bash

echo "Downloading $@"

if [[ " $@ " == *" release "* ]]; then
    sudo bash -c "$(curl -sLfo- https://raw.githubusercontent.com/hiddify/hiddify-config/main/common/download_install.sh)"
    exit $?
fi

mkdir -p /tmp/hiddify/
sed -i 's/--version 1.8.4/--version 1.8.6/g' /opt/hiddify-config/xray/install.sh
sed -i 's/--version 1.8.4/--version 1.8.6/g' /opt/hiddify-config/install.sh
curl -sL -o /tmp/hiddify/hiddify_installer.sh https://raw.githubusercontent.com/hiddify/Hiddify-Manager/main/common/hiddify_installer.sh
curl -sL -o /tmp/hiddify/utils.sh https://raw.githubusercontent.com/hiddify/Hiddify-Manager/main/common/utils.sh
chmod +x /tmp/hiddify/hiddify_installer.sh
chmod +x /tmp/hiddify/utils.sh
bash /tmp/hiddify/hiddify_installer.sh $@
