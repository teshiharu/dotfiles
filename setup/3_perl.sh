#!/bin/sh

curl -kL http://install.perlbrew.pl | bash;
echo "source ~/perl5/perlbrew/etc/bashrc" >> .bashrc;
echo "source ~/perl5/perlbrew/etc/bashrc" >> .zshrc;
source ~/.zshrc;
perlbrew -A ccflags=-fPIC install perl-5.10.1;
perlbrew switch 5.10.1;
source ~/.zshrc;
perlbrew install-cpanm
sudo yum -y install perl-ExtUtils-MakeMaker
