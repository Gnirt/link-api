#!/usr/bin/env bash

echo ">>> Installing latest NodeJS"
sudo dpkg --configure -a
sudo apt-add-repository -y ppa:chris-lea/node.js
echo ">>> HERE 1"
sudo apt-get update
echo ">>> HERE 2"
sudo apt-get install -qq nodejs
