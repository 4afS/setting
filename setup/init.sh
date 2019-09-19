# initial setting
sudo apt update
sudo apt upgrade -y

sudo apt install -y \
    git \
    wget \
    curl \
    tree \
    python3 \
    python3-pip \
    links2 \
    translate-shell \
    gnome-tweaks \
    fonts-hack

if [ ! -e $HOME/.netrc ]; then
  echo -e "machine github.com\nlogin \npassword" > .netrc
fi

# golang
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update
sudo apt-get install golang-go -y
