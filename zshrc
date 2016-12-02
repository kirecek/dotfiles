export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_TITLE="false"

plugins=(git vi-mode history-substring-search jsontools sudo systemd web-search zsh-wakatime docker)

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/.go:$HOME/devel/gopher

export GOBIN=$HOME/.go/bin

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$HOME/.local/bin:$HOME/bin:$GOROOT/bin:$PATH"

export LANG=en_US.UTF-8

export PASSWORD_STORE_DIR=$HOME/sapass/password-store

export WORKON_HOME=$HOME/.virtualenvs

export XDG_HOME_CONFIG=$HOME/.config

export TERMINAL=urxvt


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi


[ -f ~/.config/zsh/zsh_aliases ] && source ~/.config/zsh/zsh_aliases

[ -f ~/.config/zsh/zsh_tweaks ] && source ~/.config/zsh/zsh_tweaks

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

unsetopt HIST_VERIFY

