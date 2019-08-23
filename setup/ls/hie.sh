sudo apt update
sudo apt upgrade -y

sudo apt install libicu-dev libtinfo-dev libgmp-dev -y

git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules $HOME/.hie 
cd $HOME/.hie

stack ./install.hs hie-8.6.5
stack ./install.hs build-doc
