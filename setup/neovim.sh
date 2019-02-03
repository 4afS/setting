# neovim
sudo apt install software-properties-common
pip3 install neovim
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install neovim -y

# install dein.vim
mkdir -p $HOME/.vim/bundles
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/vim/bundles/installer.sh
sh $HOME/vim/bundles/installer.sh $HOME/.cache/dein 
mkdir -p $HOME/.config/nvim
wget -p $HOME/.config/nvim https://raw.githubusercontent.com/4afs/setting/master/init.vim
echo "export XDG_CONFIG_HOME='~/.config'" >> ~/.bashrc
nvim +UpdateRemotePlugins +"call dein#install()" +"q!"
