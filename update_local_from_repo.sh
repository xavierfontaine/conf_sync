#!/bin/bash
cp ./.bashrc $HOME/
cp ./.profile $HOME/
cp ./.tmux.conf $HOME/
if [[ ! -e $HOME/.config/nvim ]]; then
    mkdir -p $HOME/.config/nvim
fi
if [[ -e $HOME/.bash_profile ]]; then
    mv $HOME/.bash_profile $HOME/.bash_profile.bak
fi
cp ./init.vim $HOME/.config/nvim/
