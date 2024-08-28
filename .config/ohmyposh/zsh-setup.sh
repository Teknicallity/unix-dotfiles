#!/usr/bin/env bash

# from https://medium.com/@simontoth/best-way-to-manage-your-dotfiles-2c45bb280049
cd ~ || exit
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'" >> ~/.zshrc

mv ~/.zshrc ~/.zshrc.bak

git clone --bare git@github.com:Teknicallity/unix-dotfiles.git "$HOME"/.dotfiles-git
# dotfiles config --local status.showUntrackedFiles no
dotfiles checkout