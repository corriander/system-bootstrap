#!/usr/bin/env bash
# <help>Install mamba</help>

setup

is_mamba_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which mamba)" != "" ]
}

install_mamba() {
    echo "Installing mamba now"
    cd /tmp
    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
    mkdir -p ~/app
    bash "Mambaforge-$(uname)-$(uname -m).sh"  -b -f -p ~/app/mambaforge
}

ask_install_mamba() {
    is_mamba_installed && return
    if ask "Install mamba?"; then 
        type install_mamba | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_mamba

[ "$ALL" == "" ] && run_todo
