#!/usr/bin/env bash

echo ">>> Installing MySQL"

# Setting root password
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $1"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $1"

# Installing packages
sudo apt-get install -qq mysql-server mysql-client libmysqlclient-dev

# Binding to 0.0.0.0 for remote access
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf


# Adding grant privileges to 'root'
MYSQL=`which mysql`

Q1="GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$1' WITH GRANT OPTION;"
Q2="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}"

$MYSQL -uroot -p$1 -e "$SQL"

service mysql restart
