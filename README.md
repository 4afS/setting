## TO DO if you start setup
- HAVE TO DO when ubuntu is installed 
    - `sudo apt update && apt upgrade`

- enter `export PS1='\u@\h:\W\$ '` to .bashrc at the LAST line

- add parsonal infomation to .netrc
    - enter machine, login, password etc.

- run `source copy_dotfiles_to_home.sh`

- install dein.vim 
    - if the version of Vim 8.0 or above or NeoVim
        - run `source install_deinvim.sh`

- build an environment for development with Python3
    - if python3 is not installed or the version of python3 is less than 3.5
        - run `sudo apt install -y python3.6`
    - if pip3 is not installed or the version of pip3 is less than 9.0
        - run `sudo apt-get install -y python3-pip`

- build an environment for development with Scala
    - install JDK and JRE -> `sudo apt install -y openjdk-8-jdk` and `sudo apt install -y openjdk-8-jre`
    - install scala -> `sudo wget www.scala-lang.org/files/archive/scala-2.11.8.deb` and `sudo dpkg -i scala-2.11.8.deb`

- build an environment for development with Haskell
    - `curl -sSL https://get.haskellstack.org/ | sh`
    - `export PATH=~/.local/bin:$PATH`
    - `stack update`
    - `stack ghc` -> install ghc
    - install packages
        - `stack install ghc-mod`
        - `stack install hlint`
