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

mkdirp $HOME/.config/

symlink_dotfile "vimrc"
symlink_dotfile "vim"
symlink_dotfile "zshrc"
symlink_dotfile "gvimrc"

# NeoVim symlinks
ln -s $HOME/.vim $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim

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

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

