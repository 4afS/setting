cd `dirname $0`

# install neovim
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim -y

pip3 install neovim

sudo npm install -g neovim

mkdir -p $HOME/.config/nvim/

cd $HOME
git clone https://github.com/4afs/setting
cd setting
sh put_config.sh

nvim +PlugInstall +qall
