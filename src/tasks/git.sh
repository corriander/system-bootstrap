#!/usr/bin/env bash
# <help>Install git</help>

setup

is_git_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which git)" != "" ]
}

install_git() {
    echo "Installing git now"
    sudo apt install git
}

ask_install_git() {
    is_git_installed && return
    if ask "Install git?"; then 
        type install_git | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_git

[ "$ALL" == "" ] && run_todo
