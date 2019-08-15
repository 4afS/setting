# neovim
sudo apt install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/nostable -y
sudo apt update
sudo apt install neovim -y
pip3 install neovim

# get confing files
mkdir -p $HOME/.config/nvim/
wget -O "$HOME/.config/nvim/init.vim" https://raw.githubusercontent.com/4afs/setting/master/config/init.vim
echo "export XDG_CONFIG_HOME='\$HOME/.config'" >> ~/.bashrc
nvim +PlugInstall +"q!" +"q!"
