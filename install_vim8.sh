#install vim8
sudo apt-get remove --purge vim vim-runtime vim-common
sudo rm -rf /usr/local/share/vim
sudo rm /usr/local/bin/vim
sudo apt-get install -y git build-essential ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev
cd /opt/
git clone https://github.com/vim/vim
cd vim/
sudo ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic
sudo make
sudo make install
export PATH=$PATH:/usr/local/bin/
