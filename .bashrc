# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

# If not running interactively, don't do anything 
[ -z "$PS1" ] && return

# set -o vi           # set bash vi key-binding, done in .inputrc
# export EDITOR="vim -u ~/dotfiles/minimal.vimrc"  # vim with out reading configrations boots fast
export EDITOR="vim"

# {HISTORY}             ---------------------------------------------------{{{
# see http://mywiki.wooledge.org/BashFAQ/088
# don't put duplicate lines in the history. See bash(1) for more options # ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace
HISTIGNORE='ls:ll:l:la:clear:tree:ranger:bg:fg:history'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

#append multi-line commands to history as a single line command
shopt -s cmdhist    
# append to the history file, don't overwrite it
shopt -s histappend
# After each command, save and reload history (for Tmux); load unloaded lines, share hist between panes
export PROMPT_COMMAND="history -a; history -n"
# }}}

# {DISPLAY}             ---------------------------------------------------{{{
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[31m\]\$(parse_git_branch)\[\033[01;32m\]\$\[\033[00m\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
set color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

stty -ixon  # what is "ix" on ? don't know how it effects tty 256-color mode
export TERM=xterm-256color 
# for tmux,fbterm: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color
[ -n ""$FBTERM"" ] && export TERM=fbterm

# colorful ls and grep    -------------------------------------------------{{{
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# }}}
# colourful man pagess    -------------------------------------------------{{{
# (CLUG-Wiki style)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# }}}
# }}}

# {KEY-BINDING}             -----------------------------------------------{{{
# moved to .inputrc so that is global for all programs that uses readline
# bind -x '"\C-l":"clear"' 
bind -x '"\C-t":tmux'
bind -x '"\C-e":"explainshell $READLINE_LINE"'
# }}}

# {LOAD extral source files}  ---------------------------------------------{{{
# .bash_alias         -----------------------------------------------------{{{
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# }}}
# bash_complete       -----------------------------------------------------{{{
# enable programmable completion features (you don't need to enable this, 
# if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# }}}

# TODO load .bash_plugin/*.sh
# }}}

# {PATH}                ---------------------------------------------------{{{
append-path(){ PATH=$PATH:$1; } # from YinWang
prepend-path(){ PATH=$1:$PATH; } 
export OSFONTDIR=~/.fonts
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export PYTHONPATH=$PYTHONPATH:~/python
append-path /usr/lib/hadoop/bin # hadoop bin
export HBASE_HOME=~/hbase-0.94.7 # hbase
append-path $HBASE_HOME/bin
# append-path /usr/class/cs143/cool/bin #coolc & spim # cs143 complier COOL 
# Scala PATH          -----------------------------------------------------{{{
# append-path /home/fuel/Scala/set_up/jdk1.7.0_07/bin           #jdk 1.7
# append-path /home/fuel/Scala/set_up/sbt/bin                   #sbt(scala)
# }}}
export GOPATH=$HOME/.go # Go PATH
append-path $GOPATH/bin
prepend-path $HOME/.cabal/bin
append-path /usr/local/heroku/bin ### Heroku Toolbelt
VLFEATROOT="~/vlfeat-0.9.17";
ARCH="glnxa64";
append-path "$VLFEATROOT/bin/$ARCH"
export MANPATH="$VLFEATROOT/src":$MANPATH
# }}}

# {proxy}               -----------------------------------------------------{{{
function proxy(){
    # echo -n "username:"
    # read -e username
    # echo -n "password:"
    # read -es password
    # export http_proxy="http://$username:$password@proxyserver:8080/"
    export http_proxy="http://127.0.0.1:8087/"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    echo -e "\nProxy environment variable set."
}
function proxyoff(){
    unset HTTP_PROXY
    unset http_proxy
    unset HTTPS_PROXY
    unset https_proxy
    unset FTP_PROXY
    unset ftp_proxy
    unset RSYNC_PROXY
    unset rsync_proxy
    echo -e "\nProxy environment variable removed."
} 
# }}}
# {pdf}                 -----------------------------------------------------{{{
function pdf() {
    nohup evince "$@" &>/dev/null &
}
# }}}
# {xkcd}                -----------------------------------------------------{{{
function xkcd() {
    wget --no-proxy `lynx --dump "http://xkcd.com"|grep png` -O /tmp/xkcd.png 2>/dev/null &
    eog /tmp/xkcd.png &
}
# }}}
# {google}                ---------------------------------------------------{{{
google() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "http://www.google.com/search?q=$search" 1>/dev/null
}
# }}}
# {explainshell}                ---------------------------------------------{{{
explainshell() {
    echo "explaining: $@"
    url="http://explainshell.com"
    # search="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$@")"
    # search=$(python -c "import urllib; print urllib.quote('''$@''')")
    # search="$(ruby -r cgi -e 'puts CGI.escape(ARGV[0])' "$@")"
    # search=`php -r "echo urlencode('$DATA');"`
    search=`echo -ne $@ | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g'`
    # echo "$url/explain?cmd=$search" 
    xdg-open "$url/explain?cmd=$search" 1>/dev/null
}
# bind -x '"\C-e":"explainshell $READLINE_LINE"' moved to {KEY-BINDING}
# }}}
# {parse_git_branch}         ------------------------------------------------{{{
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# }}}
# {extract}         ---------------------------------------------------------{{{
# from https://bbs.archlinux.org/viewtopic.php?id=25166
extract () {
    while [[ "$*" != "" ]]; do
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2) tar xjf $1      ;;
                *.tar.gz)  tar xzf $1      ;;
                *.tar.xz)  tar Jxf $1      ;;
                *.bz2)     bunzip2 $1      ;;
                *.rar)     rar x $1      ;;
                *.gz)      gunzip $1      ;;
                *.tar)     tar xf $1      ;;
                *.tbz2)    tar xjf $1      ;;
                *.tgz)     tar xzf $1      ;;
                *.zip)     unzip $1      ;;
                *.Z)       uncompress $1   ;;
                *)         echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
        shift
    done

} 
# }}}




# TODO : 
# + check and {LOAD} .bash_plugin/*.sh
# + clear TERM assignment in {DISPLAY}
# + better prompt in {DISPLAY}
# + stty -ixon  # what is "ix" on? how it effects tty 256-color mode?
# + move {proxy} to .bash_plugin
# + config hadoop and add PATH
