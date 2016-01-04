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

tmux/install.sh
system_setup/configure_git.sh

function build_ycm_completers() {
    local force=$1
    local ycm_path=$script_dir/vim/bundle/YouCompleteMe
    local ycmd_path=$ycm_path/third_party/ycmd
    local gocode=$ycmd_path/third_party/gocode/gocode

    if [[ $force || ! -z $gocode ]] ; then
        $ycm_path/install.py --gocode-completer --clang-completer
    fi
}

# build_ycm_completers
