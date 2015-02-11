#!/usr/bin/env bash

echo ">>> Installing PostgreSQL Server"

sudo apt-get install -qq postgresql-9.3 postgresql-contrib-9.3;

sudo bash -c "echo 'export PATH=$PATH:/usr/lib/postgresql/9.3/bin/' >> /etc/bash.bashrc"