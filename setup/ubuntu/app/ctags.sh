cd $HOME

sudo apt install -y \
  gcc make \
  pkg-config autoconf automake \
  python3-docutils \
  libseccomp-dev \
  libjansson-dev \
  libyaml-dev \
  libxml2-dev

git clone https://github.com/universal-ctags/ctags.git .ctags && cd .ctags
./autogen.sh
./configure
make
sudo make install
