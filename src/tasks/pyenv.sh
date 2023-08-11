#!/usr/bin/env bash
# <help>Install pyenv</help>

setup $1

    
is_pyenv_installed() {
    # If you return true/1 here then it is already installed
    CONFIG_D=${PYENV_ROOT:-$HOME/.pyenv}
    [ -d $CONFIG_D ]
}

install_pyenv() {
    echo "Installing pyenv now"
    CONFIG_D=${PYENV_ROOT:-$HOME/.pyenv}
    cd ~
    curl https://pyenv.run | PYENV_ROOT=${CONFIG_D} bash
}

ask_install_pyenv() {
    is_pyenv_installed && return
    if ask "Install pyenv?"; then 
        type install_pyenv | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_pyenv

[ "$ALL" == "" ] && run_todo
