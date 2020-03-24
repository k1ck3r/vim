# CentOS
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Debian
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

export SYSTEMD_PAGER=
export LS_OPTIONS='--color=auto'	export SYSTEMD_PAGER=
eval "`dircolors`"	
alias ls='ls $LS_OPTIONS'	
alias ll='ls $LS_OPTIONS -l'	
alias l='ls $LS_OPTIONS -lA'	

# Some more QoL aliases:	
alias vi='vim'
alias rm='rm -i'	
alias cp='cp -i'	
alias mv='mv -i'	
alias sctl='systemctl'

export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='[%Y-%m-%d %H:%M:%S] '
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}

# ymarinov's prompt
if [ $EUID -eq 0 ]; then
	export PS1="\[\033[38;5;10m\][\[$(tput sgr0 -T xterm)\]\[\033[38;5;9m\]\u\[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]@\[$(tput sgr0 -T xterm)\]\[\033[38;5;3m\]\h\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]:\[$(tput sgr0 -T xterm)\]\[\033[38;5;15m\] \[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]\w\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]]\[$(tput sgr0 -T xterm)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0 -T xterm)\]"
else
	export PS1="\[\033[38;5;10m\][\[$(tput sgr0 -T xterm)\]\[\033[38;5;245m\]\u\[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]@\[$(tput sgr0 -T xterm)\]\[\033[38;5;3m\]\h\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]:\[$(tput sgr0 -T xterm)\]\[\033[38;5;15m\] \[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]\w\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]]\[$(tput sgr0 -T xterm)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0 -T xterm)\]"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
