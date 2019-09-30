sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker
sudo systemctl enable docker

echo "\nPlease reboot"
