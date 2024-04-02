#!/usr/bin/env bash
set -ex

# Install Smartgit
wget -q "https://www.syntevo.com/downloads/smartgit/smartgit-23_1_2.deb" -O smartgit.deb
apt-get update
apt-get install -y ./smartgit.deb
rm smartgit.deb

# Desktop icon
sed -i "s#Exec=/opt/Smartgit/smartgit#Exec=/opt/Smartgit/smartgit --no-sandbox#g"  /usr/share/applications/smartgit.desktop
cp /usr/share/applications/smartgit.desktop $HOME/Desktop
chmod +x $HOME/Desktop/smartgit.desktop
chown 1000:1000 $HOME/Desktop/smartgit.desktop

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
