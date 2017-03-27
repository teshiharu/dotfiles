#!/bin/sh

cpanm Task::Catalyst@4.02;
sudo cp ~/setup/iptables /etc/sysconfig/iptables;
sudo service iptables restart;
