#!/bin/bash
cp ./.bashrc $HOME/
cp ./.bash_profile $HOME/
cp ./.tmux.conf $HOME/
if [[ ! -e $HOME/.config/nvim ]]; then
    mkdir -p $HOME/.config/nvim
fi
cp ./init.vim $HOME/.config/nvim/
