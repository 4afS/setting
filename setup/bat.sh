sudo apt update
sudo apt upgrade -y

sudo apt install wget -y
wget https://github.com/sharkdp/bat/releases/download/v0.11.0/bat-musl_0.11.0_amd64.deb
sudo dpkg -i bat-musl_0.11.0_amd64.deb

rm bat-musl_0.11.0_amd64.deb
