#!/bin/zsh

# Move nvim directories into the right place
mkdir -p ~/.config
cp -R nvim/autoload ~/.config/nvim/
cp -R nvim/colors ~/.config/nvim/

# Back up hardlink destinations as filename~
ln -b nvim/init.vim ~/.config/nvim/init.vim
ln -b tmux/.tmux.conf ~/.tmux.conf
ln -b zsh/.zshrc ~/.zshrc
ln -b git/.gitconfig ~/.gitconfig
