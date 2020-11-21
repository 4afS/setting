wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage &&\
	chmod u+x nvim.appimage

./nvim.appimage --appimage-extract &&\
	sudo mv squashfs-root / &&\
       	sudo ln -s /squashfs-root/AppRun /usr/bin/nvim 
