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

echo -e "\n# variables" >> $HOME/.bashrc
echo "export PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\] > '" >> $HOME/.bashrc
echo "export EDITOR=nvim" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc

echo -e "\n# alias" >> $HOME/.bashrc
echo "alias ej='trans :ja'" >> $HOME/.bashrc
echo "alias ejb='trans :ja -b'" >> $HOME/.bashrc
echo "alias \"del.swap\"=\"rm ~/.local/share/nvim/swap/*\"" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc

echo -e "\n# functions" >> $HOME/.bashrc
echo "mkcd () { mkdir -p \"\$@\" && eval cd \"\\"\"\\$\$#\\"\"\"; }" >> $HOME/.bashrc
echo "" >> $HOME/.bashrc

# golang
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update
sudo apt-get install golang-go -y
