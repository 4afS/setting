sudo apt update
sudo apt upgrade -y

sudo apt install -y curl

curl -sSL https://get.haskellstack.org/ | sh

stack setup update
stack upgrade

stack install hlint
stack install hoogle

hoogle generate
