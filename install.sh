#!/bin/bash

echo "start link to current envirionment"
echo "your home directory is {$HOME}"

ln -s init.vim $HOME/.init.vim
ln -s .vimrc $HOME/.vimrc
ln -s .dein.toml $HOME/.dein.toml
ln -s .dein_lazy.toml $HOME/.dein_lazy.toml
ln -s .tmux.conf $HOME/.tmux.conf

echo " set $HOME directory (vimrc, init.vim dein.toml .dein_lazy.toml .tmux.conf .zshrc )"

