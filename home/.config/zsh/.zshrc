setopt NO_NOMATCH
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

#ZSH_TMUX_AUTOSTART=${ZSH_TMUX_AUTOSTART:-true}

source ~/.nix-profile/etc/profile.d/nix.sh

[[ ! -d $HOME/.zgenom ]] && git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
source "${HOME}/.zgenom/zgenom.zsh"
zgenom autoupdate

if ! command -v pyenv &> /dev/null; then
  curl https://pyenv.run | bash
fi

export NVM_LAZY_LOAD=true

# Run zgenom reset when touching this block
if ! zgenom saved; then
  zgenom ohmyzsh

  zgenom ohmyzsh plugins/colorize
  zgenom ohmyzsh plugins/cp
  zgenom ohmyzsh plugins/direnv
  zgenom ohmyzsh plugins/docker
  zgenom ohmyzsh plugins/fd
  zgenom ohmyzsh plugins/fzf
  zgenom ohmyzsh plugins/gh
  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh plugins/github
  zgenom ohmyzsh plugins/kubectl
  zgenom load lukechilds/zsh-nvm
  zgenom ohmyzsh plugins/pyenv
  zgenom ohmyzsh plugins/rbenv
  zgenom ohmyzsh plugins/ripgrep
  zgenom ohmyzsh plugins/ssh-agent
  zgenom ohmyzsh plugins/tmux

  zgenom load mafredri/zsh-async
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-history-substring-search
  # Must be the last one
  zgenom load zsh-users/zsh-syntax-highlighting
  
  zgenom save
  zgenom compile "$ZDOTDIR/.zshrc"
fi

# Plugins configurations
zstyle :omz:plugins:ssh-agent lazy yes
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Starship
eval "$(starship init zsh)"

#Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Aliases
alias s=ssh
alias circleci=circleci-cli

# FZF
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
fi

export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Miscellaneous
if command -v bat &> /dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

eval "$(pyenv init -)"
