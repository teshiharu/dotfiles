#!/bin/sh

sudo yum -y groupinstall "Development tools"
sudo yum -y install vim-enhanced nkf readline-devel wget curl man
