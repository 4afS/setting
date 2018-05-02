#install Python3.6.5
sudo apt install build-essential -y
sudo apt install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
wget https://www.python.org/ftp/python/3.6.5/Python-3.6.5.tgz
tar -xvf Python-3.6.5.tgz
cd Python-3.6.5/
./configure --enable-shared --enable-optimizations
sudo make altinstall
