#!/usr/bin/env bash
# <help>Install nvm</help>

setup

is_nvm_installed() {
    # If you return true/1 here then it is already installed
    [ -d "~/.nvm" ] || [ -d "$NVM_DIR" ]
}

install_nvm() {
    echo "Installing nvm now"

    # Ensure the directory exists if it's set in profile
    [ -z $NVM_DIR ] || mkdir -p $NVM_DIR
    repo=nvm-sh/nvm
    get_latest_tag () {
        basename $(curl -fs -o/dev/null -w %{redirect_url} https://github.com/$1/releases/latest)
    }
    latest=$(get_latest_tag $repo)
    curl -o- https://raw.githubusercontent.com/${repo}/${latest}/install.sh | PROFILE=/dev/null bash
}

ask_install_nvm() {
    is_nvm_installed && return
    if ask "Install nvm?"; then 
        type install_nvm | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_nvm

[ "$ALL" == "" ] && run_todo
