#! /usr/bin/env bash

set -e

# Helpers for readability.
bold=$(tput bold)
normal=$(tput sgr0)
function _info() {
    echo "${bold}${1}${normal}"
}

# Run script from directory where the script is stored.
cd "$( dirname "${BASH_SOURCE[0]}" )"

_info "🔧 Copying config files..."
cp .gitconfig ~/.gitconfig
cp .xsessionrc ~/.xsessionrc
cp -r config/bspwm ~/.config
cp -r config/sxhkd ~/.config/sxhkd
cp -r config/alacritty ~/.config/alacritty

_info "🚀 You are ready to go!"
