#!/bin/bash

DOWNLOADS=$HOME/Downloads
USER=$(whoami)

chown_usr_local() {
    sudo chown -R $USER:admin /usr/local
}

chown_usr_local

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
chown_usr_local

brew update

# Need GPG for some of the other installations
brew install gpg

# Install node.js
pushd $DOWNLOADS
curl -O https://nodejs.org/dist/v5.3.0/node-v5.3.0.pkg
sudo installer -pkg node-v5.3.0.pkg -target /
popd

# Use homebrew zsh
ZSH_BINARY=/usr/local/bin/zsh
brew install zsh
sudo su root -c "echo ${ZSH_BINARY} >> /etc/shells"

# Make zsh shell for current user
sudo chsh -s $ZSH_BINARY $USER

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Use brew git
brew install git

# OSX no longer includes openssl-dev stuff
brew install openssl
brew link --force openssl

# Setup python stuff
sudo easy_install pip

# VirtualBox
pushd $DOWNLOADS
curl -O http://download.virtualbox.org/virtualbox/5.0.10/VirtualBox-5.0.10-104061-OSX.dmg
sudo hdiutil attach VirtualBox-5.0.10-104061-OSX.dmp
cd /Volumes/VirtualBox
sudo installer -pkg VirtualBox.pkg -target /
chown_usr_local
popd

# python dev
pip install --user flake8

# Install go
pushd $DOWNLOADS
curl -O https://storage.googleapis.com/golang/go1.5.2.darwin-amd64.pkg
sudo installer -pkg go1.5.2.darwin-amd64.pkg -target /
popd

# Install Rust
mkdir -p ~/pkg
pushd ~/pkg
git clone --recursive https://github.com/brson/multirust
cd multirust
git submodule update --init
./build.sh
sudo ./install.sh
multirust update stable
multirust update beta
multirust update nightly
multirust default stable
popd

# Install iTerm2
pushd $DOWNLOADS
https://iterm2.com/downloads/stable/iTerm2-2_1_4.zip
unzip iTerm2-2_1_4.zip
mv iTerm.app /Applications/
popd

# Install solarized theme for iTerm2
curl https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors > Solarized.itermcolors
open Solarized.itermcolors

# Install Inconsolata-dz font
curl -O http://media.nodnod.net/Inconsolata-dz.otf.zip
unzip Inconsolata-dz.otf.zip
open Inconsolata-dz.otf

# misc packages...
brew install wireshark --with-qt
brew install ag
brew install irssi
brew install ctags
brew install ack
brew install tree
brew install netcat
brew install --HEAD valgrind
brew install cmake
brew install git
brew install ant
brew install android
brew install ninja
brew install mono
brew install ffmpeg
brew install --HEAD tmux
brew install reattach-to-user-namespace
brew install boost
brew install vim

# Run .dotfiles setup
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bash $DIR/../install.sh
