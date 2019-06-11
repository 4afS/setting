sudo apt install libicu-dev libtinfo-dev libgmp-dev

mkdir $HOME/.hie && cd $_

git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules && cd haskell-ide-engine

stack install.hs hie-8.6.5
stack install.hs build-doc
