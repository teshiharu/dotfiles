#!/bin/sh

sudo yum -y install samba;
sudo cp ~/setup/smb.conf /etc/samba/smb.conf;
echo サンバユーザを指定する; 
read user;
sudo pdbedit -a $user; 
sudo cp ~/setup/iptables /etc/sysconfig/iptables;
sudo service iptables restart;
sudo setenforce 0;
sudo cp ~/setup/selinux /etc/sysconfig/selinux;
sudo chkconfig smb on;
sudo chkconfig nmb on;
sudo service smb start;
sudo service nmb start;

