#!/usr/bin/env bash
set -ex

# Install Dbeaver
wget -q "https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb" -O dbeaver.deb
apt-get update
apt-get install -y ./dbeaver.deb
rm dbeaver.deb

# Desktop icon
sed -i "s#Exec=/opt/Dbeaver/dbeaver#Exec=/opt/Dbeaver/dbeaver --no-sandbox#g"  /usr/share/applications/dbeaver.desktop
cp /usr/share/applications/dbeaver.desktop $HOME/Desktop
chmod +x $HOME/Desktop/dbeaver.desktop
chown 1000:1000 $HOME/Desktop/dbeaver.desktop

# Cleanup for app layer
chown -R 1000:0 $HOME
find /usr/share/ -name "icon-theme.cache" -exec rm -f {} \;
if [ -z ${SKIP_CLEAN+x} ]; then
  apt-get autoclean
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
fi
