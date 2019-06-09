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

echo "export PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]: \[\033[01;34m\]\w\[\033[00m\] > '" >> $HOME/.bashrc
echo "alias ej='trans :ja'" >> $HOME/.bashrc
echo "alias ejb='trans :ja -b'" >> $HOME/.bashrc
echo "alias \"del.swap\"=\"rm ~/.local/share/nvim/swap/*\"" >> $HOME/.bashrc
echo "mkcd () { mkdir -p \"\$@\" && eval cd \"\\"\"\\$\$#\\"\"\"; }" >> $HOME/.bashrc

# golang
wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
tar -xvf go1.11.linux-amd64.tar.gz
sudo mv go /usr/local
echo "export GOROOT=/usr/local/go" >> $HOME/.bashrc
echo "export GOPATH=\$HOME/go" >> $HOME/.bashrc
echo "export PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH" >> $HOME/.bashrc
