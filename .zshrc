export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Set up Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Zinit Plugins
zinit light zsh-users/zsh-syntax-highlighting  # Colors for commands
zinit light zsh-users/zsh-completions  # Suggests based on user submitted "man" pages
zinit light zsh-users/zsh-autosuggestions  # Suggests based on history

# Keybinds
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# Load zsh-completions
autoload -U compinit && compinit

# Load Auto Complete History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # Ignores case in autocompletions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Start Oh My Posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/catppuccin_mocha_custom.omp.json')"
fi

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'  # Dotfile management
alias ls='ls --color'

# Shell Integrations
eval "$(fzf --zsh)"
