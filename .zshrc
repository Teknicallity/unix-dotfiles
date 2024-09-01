# Largely taken from https://www.youtube.com/watch?v=ud7YxC33Z3w

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export HOMEBREW_NO_ENV_HINTS=true
#eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Zinit Plugins
zinit light zsh-users/zsh-syntax-highlighting  # Colors for commands
zinit light zsh-users/zsh-completions  # Suggests based on user submitted "man" pages
zinit light zsh-users/zsh-autosuggestions  # Suggests based on history
zinit light Aloxaf/fzf-tab  # Brings fzf to autocomplete

# Add in snippets
zinit snippets OMZP::pip
zinit snippets OMZP::sudo
zinit snippets OMZP::brew
zinit snippets OMZP::command-not-found
zinit snippets OMZP::colored-man-pages

# Keybinds
bindkey '^f' autosuggest-accept
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# Load zsh-completions
autoload -U compinit && compinit
zinit cdreplay -q  # Zinit suggestion with compinit

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
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # Adds color to list
zstyle ':completion:*' menu no  # Disables default zshell completion menu
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'  # cd command fzf and preview
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'  # Needed with ZOxide

# Start Oh My Posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/catppuccin_mocha_custom.omp.json')"
#  eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/zen.toml')"
fi

# Aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-git/ --work-tree=$HOME'  # Dotfile management
alias ls='ls --color'

# Shell Integrations
eval "$(fzf --zsh)"
#eval "$(zoxide init --cmd cd zsh)"  # ZOxide - a better cd?

# Nano Config
if [ ! -d ~/.nano ]; then
  git clone https://github.com/galenguyer/nano-syntax-highlighting.git ~/.nano
fi
