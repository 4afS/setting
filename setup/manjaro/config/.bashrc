#
# ~/.bashrc
#

# for me ----------------------------------------------------------------------

  # set
    # disable overwriting existing files with the > operator set -o noclobber

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

    # extract
    ex () {
      if [ -f $1 ] ; then
        case $1 in
          *.tar.bz2)   tar xjf $1   ;;
          *.tar.gz)    tar xzf $1   ;;
          *.bz2)       bunzip2 $1   ;;
          *.rar)       unrar x $1     ;;
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

# -----------------------------------------------------------------------------

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	PS1="\[\033[01;32m\]\u\[\033[01;37m\]: \w\[\033[00m\] > "

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s checkwinsize

shopt -s expand_aliases

shopt -s histappend
