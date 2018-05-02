#!/bin/sh

#copy .vimrc to home directory
cp .vimrc ~/
cp .tmux.conf ~/

#change directory to HOME
cd $HOME

#update and ugrade
sudo apt update && sudo apt upgrade -y

#install pip3
sudo apt install python3-pip -y
sudo apt update
sudo apt install python3-pip -y

#install pip packages
sudo pip3 install virtualenv

#install packages
sudo apt-get install tree -y
sudo apt-get install vim -y 
sudo apt-get install tmux -y
sudo apt-get install curl -y

#install NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

#change template to .vim/template
mkdir ~/.vim/template
cd ~/settings/template/
cp c.txt cpp.txt Makefile.txt  ~/.vim/template
cd $HOME

#update packages
sudo apt update

#check the installed packages version
tree --version
vim --V
tmux -V
curl --version
python -V
python3 -V
python3.6 -V
pip -V
pip3 -V


