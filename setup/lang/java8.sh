sudo apt update && sudo apt upgrade -y

sudo apt install -y wget software-properties-common

wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -

sudo apt install adoptopenjdk-8-hotspot
