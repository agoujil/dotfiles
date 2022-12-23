#!/usr/bin/env sh

DOTFILES="$(pwd)"

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig
