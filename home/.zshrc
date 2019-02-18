# TMUX
setopt NO_NOMATCH

#POWERLEVEL9K_MODE='awesome-fontconfig'
#Prevent tmux to start from intellij
if ! ps -p $PPID | grep -q java; then
  ZSH_TMUX_AUTOSTART=true
fi

if [ ! -d ~/.antigen ]; then
  curl -L git.io/antigen > antigen.zsh
fi

if [ ! -d ~/.pyenv ]; then
  curl https://pyenv.run | bash
fi

source ~/antigen.zsh

antigen use oh-my-zsh
antigen bundle "history"
antigen bundle "tmux"
antigen bundle "mvn"
antigen bundle "git"
antigen bundle "cp"
antigen bundle "docker"
antigen bundle "ssh-agent"
antigen bundle "pyenv"
antigen bundle "rbenv"
antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen bundle "zsh-users/zsh-history-substring-search"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "mafredri/zsh-async"
antigen bundle sindresorhus/pure
antigen apply

bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down


#Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

export ANDROID_HOME="$HOME/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=~/.npm-global/bin:$PATH

if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Aliases
alias s=ssh
#alias umake=ubuntu-make.umake

# added by travis gem
[ -f /home/tetien850/.travis/travis.sh ] && source /home/tetien850/.travis/travis.sh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
