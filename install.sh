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
find * -maxdepth 0 -type d | xargs stow -t $HOME > /dev/null 2>&1 \
  && _info "🚀 You are ready to go!" \
  || _info "En error occured"
