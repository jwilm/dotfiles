#!/bin/bash

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function symlink_dotfile() {
    local name=$1
    local target=$script_dir/${name}
    local link_name=$HOME/.${name}

    if [[ ! -a $link_name ]]
    then
        ln -s $target $link_name
    fi
}

symlink_dotfile "vimrc"
symlink_dotfile "vim"
symlink_dotfile "zshrc"

system_setup/configure_git.sh
