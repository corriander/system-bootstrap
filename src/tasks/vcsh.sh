#!/usr/bin/env bash
# <help>Install vcsh</help>

setup

is_vcsh_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which vcsh)" != "" ]
}

install_vcsh() {
    echo "Installing vcsh now"
    sudo apt install vcsh
}

ask_install_vcsh() {
    is_vcsh_installed && return
    if ask "Install vcsh?"; then 
        type install_vcsh | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_vcsh

[ "$ALL" == "" ] && run_todo
