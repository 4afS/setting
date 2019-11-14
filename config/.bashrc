# for me ----------------------------------------------------------------------

  # set
    # disable overwriting existing files with the > operator
    set -o noclobber

  # alias
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
    alias term=gnome-terminal

    # thefuck
    if type "thefuck" > /dev/null 2>&1; then eval "$(thefuck --alias)"; fi

    # wifi
    if echo $(ifconfig) | grep -e "wlp1s0" > /dev/null; then
      alias wifi.up="sudo ifconfig wlp1s0 up"
    fi

  # export
    # nvim
    export EDITOR=nvim
    export XDG_CONFIG_HOME="$HOME/.config"

    # nodejs
    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

    # haskell
    export PATH="$HOME/.local/bin:$PATH"

    # rust
    export PATH="$HOME/.cargo/bin:$PATH"

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

    j() {
      filename=$1
      javac $filename
      filename="${filename%.*}"
      java $filename
      rm $filename.class
    }

    # mkdir and cd
    mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

    # take a backup to ~/.trash when removing files
    rm_safe() {
      if expr "$1" : "^-" >/dev/null 2>&1; then
        echo -e "\e[1;31mERROR\e[m rm-safe: don't use any options"
        return 1
      elif [ ! -e ~/.trash ]; then
        mkdir ~/.trash && mv -fit ~/.trash -fb $@
      else
        mv -fit ~/.trash -fb $@
      fi
    }
    alias rm=rm_safe

    # cargo
    cbi() {
      cargo build --release &&\
        cp $(git rev-parse --show-toplevel)/target/release/$1 ~/.cargo/bin
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

# -----------------------------------------------------------------------------

case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[[01;32m\]\u\[[00m\]: \[[01;34m\]\w\[[00m\] > '
else
    PS1='${debian_chroot:+($debian_chroot)}\u: \w > '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

