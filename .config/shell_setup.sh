#!/usr/bin/env bash

# Install vim-plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# from https://medium.com/@simontoth/best-way-to-manage-your-dotfiles-2c45bb280049
cd ~ || exit

if command -v zsh > /dev/null 2>&1; then
    mv ~/.zshrc ~/.zshrc.bak
    echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'" >> ~/.zshrc
else
    echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'" >> ~/.bash_aliases
fi

mv ~/.vimrc ~/.vimrc.bak
mv ~/.nanorc ~/.nanorc.bak

git clone --bare git@github.com:Teknicallity/unix-dotfiles.git "$HOME"/.dotfiles-git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
