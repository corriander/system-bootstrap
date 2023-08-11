#!/usr/bin/env bash
# <help>Install gh</help>

setup

is_gh_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which gh)" != "" ]
    # [ -d /some/diraectory ]
}

install_gh() {
    echo "Installing gh now"
    # INSTALL CODE HERE
    type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
}

ask_install_gh() {
    is_gh_installed && return
    if ask "Install gh?"; then 
        type install_gh | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_gh

[ "$ALL" == "" ] && run_todo
