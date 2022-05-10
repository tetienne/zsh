# XDG  Base Directory Specification
# See https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=5000
export SAVEHIST=5000

export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

# Python
export PATH="$HOME/.poetry/bin:$PATH"

# Golang
export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/opt/go@1.17/bin:$PATH

export EDITOR=vim

. "$HOME/.cargo/env"
