#!/bin/sh

git clone https://github.com/teshiharu/dotfiles.git ~/dotfiles;
# vimrc
cp ~/dotfiles/.vimrc .;
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh;
sh ./install.sh;
rm ./install.sh;
source .vimrc;
# zsh
sudo yum -y install zsh;
wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh;
cp ~/dotfiles/.zshrc .;
cp ~/dotfiles/teshima.zsh-theme ./.oh-my-zsh/custom;
chsh -s /bin/zsh;
zsh;
source .zshrc;
