#!/bin/bash

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
tmux_path=$script_dir

cat $tmux_path/tmux-main.conf > ~/.tmux.conf

platform=$(uname)

if [ "$platform" == "Darwin" ]
then
  cat $tmux_path/tmux-darwin.conf >> ~/.tmux.conf
else
  cat $tmux_path/tmux-linux.conf >> ~/.tmux.conf
fi
