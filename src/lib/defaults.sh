# This updates the current install


function install_base_packages() {
    # NOTE: Update this with the latest tool added to the list
    sudo apt update

    echo "Installing packages from standard package repositories"
    packages=()

    # Base packages
    packages+=(keychain build-essential jq unzip tree)

    # Neovim dependencies (python3-venv is needed by Mason for installing)
    packages+=(gcc g++ make cmake fd-find ripgrep python3-venv)

    # pyenv build environment dependencies
    #
    # Required to successfully build python 
    # See https://github.com/pyenv/pyenv/wiki#suggested-build-environment
    packages+=(build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev)

    # Additional pyenv deps grabbed from other sources
    packages+=(zlib1g lzma)

    # Not the recommended way to install ruby, but we don't care we just need rubygems for some things
    packages+=(ruby)

    sudo apt install -y "${packages[@]}"

    echo "Installing WSL utilities from PPA"
    sudo add-apt-repository -y ppa:wslutilities/wslu
    sudo apt update
    sudo apt install -y wslu
}
