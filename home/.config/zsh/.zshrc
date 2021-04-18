setopt NO_NOMATCH
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

ZSH_TMUX_AUTOSTART=${ZSH_TMUX_AUTOSTART:-true}

if [ ! command -v antigen &> /dev/null ]; then
  curl -L git.io/antigen > ~/antigen.zsh
fi

if [ ! command -v pyenv &> /dev/null ]; then
  curl https://pyenv.run | bash
fi

export NVM_LAZY_LOAD=true
source ~/antigen.zsh

antigen use oh-my-zsh
antigen bundle "tmux"
antigen bundle "git"
antigen bundle "github"
antigen bundle "cp"
antigen bundle "docker"
antigen bundle "ssh-agent"
antigen bundle "pyenv"
antigen bundle "rbenv"
antigen bundle "lukechilds/zsh-nvm"
antigen bundle "colorize"
antigen bundle "supercrabtree/k"
antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen bundle "zsh-users/zsh-history-substring-search"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "mafredri/zsh-async"
antigen bundle "sindresorhus/pure --branch=main"
antigen apply

bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

#Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)


eval "$(gh completion -s zsh)"

# Aliases
alias s=ssh
alias fd=fdfind

# fzf
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [[ -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
  source /usr/share/doc/fzf/examples/completion.zsh
fi

export FZF_DEFAULT_COMMAND="fdfind --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PATH="$PATH:$HOME/.poetry/bin:$HOME/.rvm/bin"
