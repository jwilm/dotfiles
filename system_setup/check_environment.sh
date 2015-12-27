#!/bin/zsh

source ~/.zshrc

echo_red() {
    echo -e "\033[31m$@\033[0m"
}

assert_exists() {
    local binary=$1
    if [[ $(which $binary) != 0 ]]
    then
        echo_red "$binary does not exist"
        exit 1
    fi
}


assert_exists flake8
assert_exists node
assert_exists npm
assert_exists go
assert_exists tmux
assert_exists vim
assert_exists cargo
assert_exists rustc
