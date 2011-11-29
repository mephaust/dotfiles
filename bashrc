# Config settings
USE_COLOR=1
export EDITOR=vim

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# FUNCTIONS

mkcd () {
	mkdir -p "$*"
	cd "$*"
}

postpath () {
	for d; do
		case ":$PATH:" in
			*":$d:"*) :;;
			*) export PATH=$PATH:$d;;
		esac
	done
}

prepath () {
	for d; do
		case ":$PATH:" in
			*":$d:"*) :;;
			*) export PATH=$d:$PATH;;
		esac
	done
}

# TERMCAP MANGLING

# Make TERM more compatible if terminfo is old
if [ $TERM == "nsterm-16color" ]; then
	$(infocmp nsterm-16color &>/dev/null) || export TERM=nsterm
fi

# fix termcap for pre-Lion Terminal.app
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ $TERM_PROGRAM_VERSION -lt 297 ]; then
	export TERM=nsterm-16color
fi

# Fix for gnome-terminal
if [ "$COLORTERM" == "gnome-terminal" ]; then
	$(infocmp gnome &>/dev/null) && export TERM=gnome
fi

# HISTORY
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='[%F %T ] '
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# MAN I DON'T EVEN KNOW
shopt -s checkwinsize
shopt -s no_empty_cmd_completion

# PRETTY PRETTY COLORS
if [ $USE_COLOR == 1 ]; then
	export CLICOLOR=1

	export PS1='\e[01;32m\u@\h\e[m:\e[0;34m\W\e[m\n$? \$ '
else
	export PS1='\u@\h:\W\n$? \$ '
fi

# PATH

# gempath
if [ -e $HOME/.gem/ruby/1.8/bin ]; then
	prepath $HOME/.gem/ruby/1.8/bin
else
	type -P gem &>/dev/null && prepath $(gem env gemdir)/bin
fi

if [ -e ~/bin ]; then
	prepath $HOME/bin
fi


# ALIASES
alias ll="ls -al"

type -P ack-grep &>/dev/null && alias ack="ack-grep"

# quickie timezone adjusts
alias tzl="TZ='America/Los_Angeles'"
alias tzu="TZ='UTC'"

# in case our TERM settings are too ambitious
alias cterm="TERM=xterm-color"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Any per-host overrides
if [ -r ~/.bashrc_local ]; then
	. ~/.bashrc_local
fi
