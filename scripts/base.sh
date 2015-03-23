#!/usr/bin/env bash

echo "Setting Timezone & Locale to $3 & C.UTF-8"

sudo ln -sf /usr/share/zoneinfo/$3 /etc/localtime
sudo locale-gen UTF-8
export LANG=C.UTF-8

echo "export LANGUAGE=en_US.UTF-8" >> /home/vagrant/.bashrc
echo "export LANG=en_US.UTF-8" >> /home/vagrant/.bashrc
echo "export LC_ALL=en_US.UTF-8" >> /home/vagrant/.bashrc
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

echo ">>> Installing Base Packages"

# Update
sudo apt-get update

# Install base packages
sudo apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential imagemagick libmagickcore-dev libmagickwand-dev libpq-dev

# Common fixes for git
git config --global http.postBuffer 65536000

# Cache http credentials for one day while pull/push
git config --global credential.helper 'cache --timeout=86400'

