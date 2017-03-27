#!/bin/sh

mkdir ~/mysql_rpm;
cd ~/mysql_rpm;
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-client-5.5.38-1.el6.x86_64.rpm;
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-5.5.38-1.el6.x86_64.rpm;
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-compat-5.5.38-1.el6.x86_64.rpm;
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-devel-5.5.38-1.el6.x86_64.rpm;
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-test-5.5.38-1.el6.x86_64.rpm;
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-server-5.5.38-1.el6.x86_64.rpm;
sudo yum localinstall MySQL-*;
cd;
sudo chkconfig mysql on;
sudo /etc/init.d/mysql start;
rm -rf ~/mysql_rpm;
