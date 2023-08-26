#!/usr/bin/env bash
# <help>Install everything (after asking if you want to)</help>

export ALL=1

setup

echo " "
echo " "

# Start Commands
if [ -n "$DISPLAY" ]; then
  $0 default_gui_packages
fi

$0 git
$0 myrepos
$0 vcsh
$0 pyenv
$0 mamba
$0 poetry
$0 nvm
$0 gh
$0 tmuxinator
# End Commands

run_todo
