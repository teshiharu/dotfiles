#!/bin/sh

wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm;
sudo rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm;
sudo yum -y install tmux;
rm rpmforge*;
