#!/usr/bin/env bash

# Install vim-plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# from https://medium.com/@simontoth/best-way-to-manage-your-dotfiles-2c45bb280049
cd ~ || exit

mv ~/.zshrc ~/.zshrc.bak
mv ~/.vimrc ~/.vimrc.bak
mv ~/.nanorc ~/.nanorc.bak

echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'" >> ~/.zshrc
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'

git clone --bare git@github.com:Teknicallity/unix-dotfiles.git "$HOME"/.dotfiles-git
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
