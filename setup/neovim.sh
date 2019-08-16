# neovim
sudo apt install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim -y
pip3 install neovim

mkdir -p $HOME/.config/nvim/

# get confing files
cd $HOME
git clone https://github.com/4afs/setting
cd setting
sh put_config.sh

echo "export XDG_CONFIG_HOME='\$HOME/.config'" >> ~/.bashrc
nvim +PlugInstall +"q!" +"q!"
