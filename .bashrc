### --- Source global definitions.
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

### --- Disable systemctl's auto-paging feature.
export SYSTEMD_PAGER=

### --- User specific aliases and functions.
alias vi='vim'
alias sctl='systemctl'

### --- Don't put duplicate lines in the history.
HISTCONTROL=ignoreboth

### --- Set history format.
HISTTIMEFORMAT='[%Y-%m-%d %H:%M:%S] '
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}

### --- Set prompt.
# PS1="\[\033[00m\][\[\033[00;31m\]\u\[\033[00m\]][\[\033[00;32m\]\h\[\033[00m\]][\[\033[00;34m\]\w\[\033[00m\]]#\[\033[00m\] "

# ymarinov
export PS1="\[\033[38;5;10m\][\[$(tput sgr0 -T xterm)\]\[\033[38;5;9m\]\u\[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]@\[$(tput sgr0 -T xterm)\]\[\033[38;5;3m\]\h\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]:\[$(tput sgr0 -T xterm)\]\[\033[38;5;15m\] \[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]\w\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]]\[$(tput sgr0 -T xterm)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0 -T xterm)\]"
