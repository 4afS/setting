cd $HOME

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
  git

git clone https://github.com/4afs/setting
cd setting/setup

sh init.sh

cd neovim

sh nodejs.sh
sh yarn.sh
sh neovim.sh

cd $HOME/setting
sh put_config.sh

echo "\nall done!"
