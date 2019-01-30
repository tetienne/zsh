# TMUX
setopt NO_NOMATCH

#POWERLEVEL9K_MODE='awesome-fontconfig'
#Prevent tmux to start from intellij
if ! ps -p $PPID | grep -q java; then
  ZSH_TMUX_AUTOSTART=true
fi

# Install zplug if missing
if [ ! -d ~/.zplug ]; then
          curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

source ~/.zplug/init.zsh
zplug "lib/history", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh
zplug "plugins/rbenv", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-history-substring-search", from:github
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug load

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
alias umake=ubuntu-make.umake 

# added by travis gem
[ -f /home/tetien850/.travis/travis.sh ] && source /home/tetien850/.travis/travis.sh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
