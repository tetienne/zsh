setopt NO_NOMATCH
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

#ZSH_TMUX_AUTOSTART=${ZSH_TMUX_AUTOSTART:-true}

if [ ! command -v antigen &> /dev/null ]; then
  curl -L git.io/antigen > ~/antigen.zsh
fi

if ! command -v pyenv &> /dev/null; then
  curl https://pyenv.run | bash
fi

export NVM_LAZY_LOAD=true
source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle "colorize"
antigen bundle "cp"
antigen bundle "direnv"
antigen bundle "docker"
antigen bundle "fd"
antigen bundle "fzf"
antigen bundle "gh"
antigen bundle "git"
antigen bundle "github"
antigen bundle "kubectl"
antigen bundle "lukechilds/zsh-nvm"
antigen bundle "pyenv"
antigen bundle "rbenv"
antigen bundle "ripgrep"
antigen bundle "ssh-agent"
antigen bundle "tmux"

antigen bundle "mafredri/zsh-async"
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-history-substring-search"
# Must be the last one
antigen bundle "zsh-users/zsh-syntax-highlighting"

antigen apply

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

# FZF
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Miscellaneous
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

