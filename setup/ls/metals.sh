mkdir -p $HOME/.install_metals
cd $HOME/.install_metals/

# Make sure to use coursier v1.1.0-M9 or newer.
curl -L -o coursier https://git.io/coursier
chmod +x coursier
sudo ./coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  org.scalameta:metals_2.12:0.7.0 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-vim -f

rm -rf $HOME/.install_metals
cd $HOME
