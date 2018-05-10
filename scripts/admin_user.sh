#!/usr/bin/env bash
set -eux

###----------------------------------------------------------------------------
### VARIABLES
###----------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive
adminHome='/home/ubuntu'
backupDir="$adminHome/backup"

## Setup ~/.bashrc
printf '\n\n%s\n' "Setting the ~/.bash_aliases file..."
cp -pv "$adminHome/.bashrc" "$backupDir/bashrc.orig"
cat <<EOF > "$adminHome/.bash_aliases"
###--------------- BECAUSE WE'RE NOT ANIMALS ----------------------------------
# some more ls aliases
alias ll='ls -l   --color=always'
alias la='ls -lAh --color=always'
alias ld='ls -ld  --color=always'
alias lh='ls -lh  --color=always'
alias lt='ls -l   --full-time --color=always'
alias cp='cp -pv'

export EDITOR='/usr/bin/vim'
alias vi="\$EDITOR"

###----------------------------------------------------------------------------
### Find Stuff on the filesystem (fs). These are starter functions. To tailor
### them to more-fit your workstyle type 'man find' (in the shell) and modify
### them until you are happy.
###----------------------------------------------------------------------------
# Find files somewhere on the system; to use:
#   1) call the alias, 'findsys'
#   2) pass a directory where the search should begin, and
#   3) pass a file name, either exact or fuzzy: e.g.:
# \$ findsys /var/ '*.log'
function findSystemStuff()   {
    findDir="\$1"
    findFSO="\$2"
    sudo find "\$findDir" -name 'proc' -prune , -name 'dev' -prune , -name 'sys' -prune , -name 'run' -prune , -name "\$findFSO"
}

alias findsys=findSystemStuff
###----------------------------------------------------------------------------
# Find fs objects (directories, files) in your home directory; To use:
#   1) call the alias, 'findmy'
#   2) pass a 'type' of fs object, either 'f' (file) or 'd' (directory)
#   3) pass the object name, either exact or fuzzy: e.g.:
# \$ findmy f '.vimr*'
function findMyStuff()   {
    findType="\$1"
    findFSO="\$2"
    find "\$HOME" -type "\$findType" -name "\$findFSO"
}

alias findmy=findMyStuff
###----------------------------------------------------------------------------
EOF

cp "$adminHome/.bash_aliases" "/root/.bash_aliases"

chown "ubuntu:ubuntu" "$adminHome/.bash_aliases"


cat <<EOF >> "$HOME/.bashrc"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

EOF

