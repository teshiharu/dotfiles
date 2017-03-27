#!/bin/sh

sudo echo "[nginx]\n name=nginx repo\n baseurl=http://nginx.org/packages/centos/$releasever/$basearch/\n gpgcheck=0\n enabled=1\n" > /etc/yum.repos.d/nginx.repo;
sudo yum -y install nginx;
sudo chkconfig nginx off;
