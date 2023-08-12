# This updates the current install


function install_base_packages() {
    # NOTE: Update this with the latest tool added to the list
    sudo apt update

    sudo apt install -y keychain gcc g++ make cmake fd-find ripgrep build-essential jq unzip

    echo "Installing pyenv build environment dependencies"
    # Required to successfully build python
    # See https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    # Couple of additional ones sourced elsewhere
    sudo apt install -y zlib1g lzma
}
