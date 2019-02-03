# neovim
sudo apt install software-properties-common
pip3 install neovim
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install neovim -y

# install dein.vim
mkdir -p $HOME/.vim/bundles
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.vim/bundles/installer.sh
sh ~/.vim/bundles/installer.sh ~/.cache/dein 

# get confing files
mkdir -p $HOME/.config/nvim/
wget -O "$HOME/.config/nvim/init.vim" https://raw.githubusercontent.com/4afs/setting/master/config/init.vim
echo "export XDG_CONFIG_HOME='~/.config'" >> ~/.bashrc
nvim +UpdateRemotePlugins +"call dein#install()" +"q!"
