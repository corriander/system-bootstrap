#!/usr/bin/env bash
# <help>Install tmuxinator</help>

setup

is_tmuxinator_installed() {
    # If you return true/1 here then it is already installed
    # [ "$(which tmuxinator)" != "" ]
    # [ -d /some/diraectory ]
    command -v -- tmuxinator >/dev/null 2>&1
}

install_tmuxinator() {
    echo "Installing tmuxinator now"
    sudo gem install tmuxinator
}

ask_install_tmuxinator() {
    is_tmuxinator_installed && return
    if ask "Install tmuxinator?"; then 
        type install_tmuxinator | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_tmuxinator

[ "$ALL" == "" ] && run_todo
