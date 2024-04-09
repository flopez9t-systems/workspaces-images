#!/bin/bash

ECLIPSE_VER_DATE="2024-03"

cd /tmp
wget -q -O eclipse.tar.gz "https://mirrors.xmission.com/eclipse/technology/epp/downloads/release/2024-03/R/eclipse-jee-2024-03-R-linux-gtk-x86_64.tar.gz"
tar -xzf eclipse.tar.gz -C /opt
