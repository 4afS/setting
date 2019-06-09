sudo apt update && sudo apt upgrade -y

sudo apt install -y curl

mkdir $HOME/.stack.install && cd $HOME/.stack.install

curl -sSL https://get.haskellstack.org/ | sh

stack setup update
stack install hlint
stack install hoogle

echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> $HOME/.bashrc
. $HOME/.bashrc

hoogle generate

echo "alias ghc=\"stack ghc\"" >> $HOME/.bashrc
echo "alias ghci=\"stack ghci\"" >> $HOME/.bashrc
echo "alias runghc=\"stack runghc\"" >> $HOME/.bashrc
. $HOME/.bashrc
