#!/bin/sh

#copy .vimrc to home directory
cp .vimrc ~/
cp .tmux.conf ~/

#change directory to HOME
cd $HOME

#update and ugrade
sudo apt update && sudo apt upgrade -y

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


