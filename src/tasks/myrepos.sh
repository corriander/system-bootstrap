#!/usr/bin/env bash
# <help>Install myrepos</help>

setup

is_myrepos_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which mr)" != "" ]
}

install_myrepos() {
    echo "Installing myrepos now"
    # INSTALL CODE HERE
    sudo apt install myrepos
}

ask_install_myrepos() {
    is_myrepos_installed && return
    if ask "Install myrepos?"; then 
        type install_myrepos | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_myrepos

[ "$ALL" == "" ] && run_todo
