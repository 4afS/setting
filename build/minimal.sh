cd $HOME

sudo apt install
sudo apt upgrade -y

sudo apt install -y \
  git

git clone https://github.com/4afs/setting
cd setting

sh put_config.sh

cd setup

sh init.sh

cd neovim

sh nodejs.sh
sh yarn.sh
sh neovim.sh

echo "\nall done!"
