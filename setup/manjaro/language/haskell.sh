yay -S stack
stack --resolver ghc-8.6.5 setup

if [[ ! -d "$HOME/app" ]]; then
  mkdir $HOME/app
fi

git clone https://github.com/digital-asset/ghcide.git $HOME/app/ghcide &&\
  cd ghcide &&\
  stack install
