# This updates the current install


function install_base_packages() {
    # NOTE: Update this with the latest tool added to the list
    sudo apt update

    sudo apt install -y keychain gcc g++ make cmake fd-find ripgrep build-essential jq unzip
}
