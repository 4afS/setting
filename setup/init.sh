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
  echo -e "machine github.com\nlogin \npassword" > $HOME/.netrc
fi

