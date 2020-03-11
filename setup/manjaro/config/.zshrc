source ~/.zplug/init.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH

DISABLE_MAGIC_FUNCTIONS=true

# User configuration
# zsh
  compinit
  autoload -U promptinit; promptinit
  prompt pure

  setopt no_beep
  # key-bind
    bindkey -v

    bindkey "^l" forward-char
    bindkey "^h" backward-char

    autoload -Uz history-search-end
    zle -N history-beginning-search-backward-end history-search-end
    zle -N history-beginning-search-forward-end history-search-end
    bindkey -M viins "^k" history-beginning-search-backward-end
    bindkey -M viins "^j" history-beginning-search-forward-end

  # completion
    setopt list_packed
    setopt magic_equal_subst

    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

    autoload -Uz compinit
    compinit -u
    if [ -e /usr/local/share/zsh-completions ]; then
      fpath=(/usr/local/share/zsh-completions $fpath)
    fi

  # cd
    setopt auto_cd
    setopt auto_pushd
    cdpath=(~)

  # history
    setopt hist_ignore_dups
    setopt hist_ignore_all_dups

    HISTFILE=~/.zsh_history
    HISTSIZE=2000
    SAVEHIST=2000

  # plugin
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-completions"
    zplug "zdharma/fast-syntax-highlighting"
    zplug "b4b4r07/zsh-vimode-visual"
    zplug "b4b4r07/enhancd"
    zplug "zplug/zplug", hook-build:'zplug --self-manage'

    # config
      ENHANCD_DISABLE_DOT=1
      ENHANCD_DISABLE_HOME=1

    # theme
      zplug "mafredri/zsh-async", from:github
      zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme


    if ! zplug check; then
      zplug install
    fi
    zplug load

# alias
  # bash
  alias :q=exit

  # transration
  alias ej='trans :ja'
  alias ejb='trans :ja -b'

  # neovim
  alias del.swap="rm ~/.local/share/nvim/swap/*"
  alias vims=nvim
  alias vim=nvim
  alias vi=nvim
  alias v=nvim

  # haskell
  alias ghc="stack ghc"
  alias ghci="stack ghci"
  alias runghc="stack runghc"

  # terminal
  alias term=xfce4-terminal
  alias termt='xfce4-terminal --tab'

  # thefuck
  if type "thefuck" > /dev/null 2>&1; then eval "$(thefuck --alias f)"; fi

  # oit
  alias oit.vpn="sudo openfortivpn vpn2.oit.ac.jp:443 --username e1q18048 -p"
  alias oit.ssh="ssh e1q18048@o-vnc.center.oit.ac.jp"

  # ls
  alias ls='ls --color=auto'
  alias sl=ls
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'

  # grep
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  # path
  alias to.vim="cd ~/.config/nvim/"
  alias to.go="cd ~/program/go"

  # terminal
  alias term="gnome-terminal >& /dev/null"

  # others
  alias untargz='tar -zxvf'
  alias cp="cp -i"
  alias df='df -h'
  alias free='free -m'
  alias np='nano -w PKGBUILD'
  alias more=less

# export
  # bash
  export HISTCONTROL=ignoredups:erasedups

  # nvim
  export EDITOR=nvim
  export XDG_CONFIG_HOME="$HOME/.config"

  # nodejs
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

  # haskell
  export PATH="$HOME/.local/bin:$PATH"

  # rust
  export PATH="$HOME/.cargo/bin:$PATH"

  # go
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin
  export GO111MODULE=on

  # fcitx
  export GTK_IM_MODULE=fcitx
  export XMODIFIERS=@im=fcitx
  export QT_IM_MODULE=fcitx

# plugin
  # diar
  diar-jump(){
    local result=$(diar jump $1)
    if [ -n "$result" ]; then
      if echo "$result" | grep -e "error:" > /dev/null || [ "$1" = "-h" ]; then
        echo -e "$result"
      else
        \cd $result
      fi
    fi
  }

  alias da="diar add"
  alias dd="diar delete"
  alias dr="diar rename"
  alias dl="diar list"
  alias dj="diar-jump"
  alias dp="diar-jump -p"

  # exer
  run() {
    local result=$(exer run)
    if [[ $result =~ "Error:" ]]; then
      echo $result
    else
      sh -c "$result"
    fi
  }


# command
  # java19
  if [ -e "$HOME/.java19" ]; then source $HOME/.java19; fi

  # j() {
  #   filename=$1
  #   javac $filename
  #   filename="${filename%.*}"
  #   java $filename
  #   rm $filename.class
  # }

  # mkdir and cd
  mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

  # take a backup to ~/.trash when removing files
  # rm_safe() {
  #   if expr "$1" : "^-" >/dev/null 2>&1; then
  #     echo -e "\e[1;31mERROR\e[m rm-safe: don't use any options"
  #     return 1
  #   elif [ ! -e ~/.trash ]; then
  #     mkdir ~/.trash && mv -fit ~/.trash -fb $@
  #   else
  #     mv -fit ~/.trash -fb $@
  #   fi
  # }
  # alias rm=rm_safe

  # cargo
  cbi() {
    cargo build --release &&\
      cp $(git rev-parse --show-toplevel)/target/release/$1 ~/.cargo/bin
  }

  # extract
  ex () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
      esac
    else
      echo "'$1' is not a valid file"
    fi
  }

# go
  alias go.init=go-init
  go-init() {
    mkdir $1
    cd $1
    go mod init github.com/`git config user.name`/$1
    git init
    cd ..
  }


# script
  # remove duplicate path 
  _path=""
  for _p in $(echo $PATH | tr ':' ' '); do
    case ":${_path}:" in
      *:"${_p}":* )
        ;;
      * )
        if [ "$_path" ]; then
          _path="$_path:$_p"
        else
          _path=$_p
        fi
        ;;
    esac
  done
  PATH=$_path
  unset _p
  unset _path

# PROMPT=" %~ : ${current_branch} > "


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
