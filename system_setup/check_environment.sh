#!/bin/zsh

source ~/.zshrc

echo_red() {
    echo -e "\033[31m$@\033[0m"
}

assert_exists() {
    local binary=$1
    if [[ "$(which $binary)" == "" ]]
    then
        echo_red "$binary does not exist"
        exit 1
    fi
}

assert_equal() {
    local actual=$1
    local expected=$2
    if [[ $actual != $expected ]]
    then
        echo_red "$actual does not equal $expected"
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

assert_equal "$(git config --global user.name)" "Joe Wilm"

