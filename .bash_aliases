#! /bin/bash

#some more ls aliases
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'

# rlwrap for better interaction alias sml="rlwrap -c -r -b '(){}[].,=&^%$#@\;|' sml" alias mit-scheme="rlwrap -c -r -b '(){}[].,=&^%$#@\;|' mit-scheme"
alias scheme="rlwrap -c -r -b '(){}[].,=&^%$#@\;|' scheme"
alias racket="rlwrap -c -r -b '(){}[].,=&^%$#@\;|' racket"
alias scsh="rlwrap -c -r -b '(){}[].,=&^%$#@\;|' scsh"
alias m4="rlwrap -c -r -m -b '(){}[].,=&^%$#@\;|' m4"

# GAE
alias dev_appserver="python2.7 /home/fuel/google_appengine/dev_appserver.py"
alias appcfg="python2.7 /home/fuel/google_appengine/appcfg.py"

# TO-DO : should use path instead:
alias netlogo="/home/fuel/bin/NetLogo/netlogo-5.0.3/netlogo.sh"
alias netlogo-3D="/home/fuel/bin/NetLogo/netlogo-5.0.3/netlogo-3D.sh"
alias gephi="/home/fuel/bin/gephi/bin/gephi"
alias lingo12="/home/fuel/lingo12/run.sh"
alias scala_ide="/home/fuel/Scala/set_up/eclipse/eclipse"
alias googlecl="/usr/bin/google" #already has function `google ` for google search in .bashrc
alias chrome="google-chrome"
alias zotero="/home/fuel/bin/Zotero_linux-x86_64/run-zotero.sh"


# google-translate-cli
alias 2zh="translate {=zh}"
alias 2en="translate {=en}"

# aliases for hadoop-conf
alias hadoop-conf="sudo update-alternatives --config hadoop-conf"
# aliases for HDFS
alias dfsput="hadoop fs -put" 
alias dfsget="hadoop fs -get"
alias dfsls="hadoop fs -ls"
alias dfsrm="hadoop fs -rm"
alias dfsrmr="hadoop fs -rmr"
alias dfscat="hadoop fs -cat"
alias dfsmkdir="hadoop fs -mkdir"

# MISC
alias update="sudo aptitude update"
alias cd..="cd .."
# alias pdf="evince" #gnome documentation viewer
alias fuelproxy="python ~/GFW/goagent/local/proxy.py"
alias fq='ssh -qTfnN -D 7070 fuelproxy@216.194.70.6'  # ssh tunnel at port 7070
alias login2cjb='ssh fuelproxy@216.194.70.6'

alias fbt256="TERM=fbterm"      # fbterm 256 color mode in tty
alias fbterm='FBTERM=1 fbterm'  # set flag $FBTERM and start fbterm

# Savety
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# fast config files editing
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmux.conf='vim ~/.tmux.conf'

# ssh GUI flags
alias sshTrusted='ssh -Y'
alias sshUntrusted='ssh -X -C -c blowfish-cbc,arcfour'

alias RAT="idl80 -vm=/home/fuel/bin/rat_v0.21/rat.sav"

export PUBLIC=/run/user/1000/gvfs/smb-share:server=192.168.1.99,share=public

alias g='git status'
alias gd='git diff'
alias gdc='git diff --cached'

