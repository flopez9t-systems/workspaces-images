#!/usr/bin/env bash
set -ex

# Install Smartgit
wget -q https://www.syntevo.com/downloads/smartgit/smartgit-win-23_1_3.zip -O smartgit.deb
apt-get update
apt-get install -y ./smartgit.deb

# Desktop icon
rm smartgit.deb

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
