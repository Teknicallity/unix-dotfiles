# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/catppuccin_mocha_custom.omp.json')"
fi
alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME
