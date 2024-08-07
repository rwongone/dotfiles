#!/bin/zsh

# Move nvim directories into the right place
mkdir -p ~/.config ~/bin
# cp -R nvim/autoload ~/.config/nvim/
# cp -R nvim/colors ~/.config/nvim/

# Back up hardlink destinations as filename
ln -s `realpath nvim` ~/.config/nvim
ln -f tmux/.tmux.conf ~/.tmux.conf
ln -f zsh/.zshrc ~/.zshrc
ln -f git/.gitconfig ~/.gitconfig
ln -f git/git_diff_wrapper ~/bin/git_diff_wrapper
ln -f ideavim/.ideavimrc ~/.ideavimrc

# Set up .z.sh
curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.z.sh

# Set up oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
