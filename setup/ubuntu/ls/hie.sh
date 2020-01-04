sudo apt update
sudo apt upgrade -y

sudo apt install -y\
  git \
  libicu-dev \
  libtinfo-dev \
  libgmp-dev

git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules $HOME/.hie 
cd $HOME/.hie

stack ./install.hs hie-8.6.5
