#!/usr/bin/env bash

echo ">>> Installing latest NodeJS"

sudo apt-add-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -qq nodejs
