#!/bin/bash

git config --global user.name "Joe Wilm"

git_email=$(git config --global user.email)

if [[ -z $git_email ]] ; then
    git config --global user.email joe@jwilm.com
fi

git config --global color.ui true

git config --global core.editor /usr/local/bin/vim

git config --global alias.lg1 "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(reset)%s%C(reset) %C(dim green)- %an%C(reset)%C(bold red)%d%C(reset)' --all"
git config --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
git config --global alias.lg  "!git lg1"

platform=$(uname)

if [[ $platform == *Darwin* ]] ; then
    git config --global credential.helper osxkeychain
fi

git config --global merge.conflictstyle diff3

