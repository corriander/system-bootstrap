#!/usr/bin/env bash
# <help>Install poetry</help>

setup

is_poetry_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which poetry)" != "" ]
}

install_poetry() {
    echo "Installing poetry now"
    cd ~
    curl -sSL https://install.python-poetry.org | python3 -
}

ask_install_poetry() {
    is_poetry_installed && return
    if ask "Install poetry?"; then 
        type install_poetry | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_poetry

[ "$ALL" == "" ] && run_todo
