# some default packages
yum install redhat-lsb-core ncdu  telnet fail2ban-server bash-completion net-snmp yum-plugin-copr yum-utils yum-plugin-changelog python3 python3-pip  htop curl wget lsof nano vim-enhanced gdisk parted git tcpdump iotop sysstat iptables-services net-tools bind-utils telnet mlocate mc pciutils -y

# python's things
pip3 install --upgrade pip && pip3 install powerline-status

### pathogen install
mkdir -p .vim/{autoload,bundle}
git clone https://github.com/tpope/vim-pathogen.git /tmp/pathogen && cp /tmp/pathogen/autoload/pathogen.vim .vim/autoload/
cp vim/hacks/systemctl /etc/bash_completion.d/

### vim
cat vim/vimrc > ~/.vimrc

### PS1 system wide
echo 'if [ $EUID -eq 0 ]; then
    export PS1="\[\033[38;5;10m\][\[$(tput sgr0 -T xterm)\]\[\033[38;5;9m\]\u\[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]@\[$(tput sgr0 -T xterm)\]\[\033[38;5;3m\]$(hostname -f|sed s/.x3me.net//)\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]:\[$(tput sgr0 -T xterm)\]\[\033[38;5;15m\] \[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]\w\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]]\[$(tput sgr0 -T xterm)\]\[\033[38;5;9m\]\\$ \[$(tput sgr0 -T xterm)\]"
else
    export PS1="\[\033[38;5;10m\][\[$(tput sgr0 -T xterm)\]\[\033[38;5;245m\]\u\[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]@\[$(tput sgr0 -T xterm)\]\[\033[38;5;3m\]$(hostname -f|sed s/.x3me.ent//)\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]:\[$(tput sgr0 -T xterm)\]\[\033[38;5;15m\] \[$(tput sgr0 -T xterm)\]\[\033[38;5;14m\]\w\[$(tput sgr0 -T xterm)\]\[\033[38;5;10m\]]\[$(tput sgr0 -T xterm)\]\[\033[38;5;245m\]\\$ \[$(tput sgr0 -T xterm)\]"
fi' >> /etc/bashrc

### alias and bash options system wide
echo "alias vi='vim'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias sctl='systemctl'
alias c='clear'
alias rm_old_kernels='package-cleanup --oldkernels --count=2'

export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='[%Y-%m-%d %H:%M:%S] '
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}

[ -f /etc/profile.d/grc.bashrc ] && source /etc/profile.d/grc.bashrc
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
" >> /etc/bashrc

### nice reverse search
cp -r vim/.fzf* ~
chmod +x ~/.fzf/bin/fzf

### coloring some unix tools (eg. ps, tail, lsof etc etc)
cd vim/pkg && tar xvfz grc_1.11.3.orig.tar.gz && cd grc-1.11.3 && ./install.sh && cd ~

# set MAX kernel which can be installed
dnf remove --oldinstallonly --setopt installonly_limit=2 kernel

# disable SELinux
/etc/selinux/config

# disable network manager and firewalld
systemctl disable --now NetworkManager firewalld

# install simple network scripts
yum install network-scripts
