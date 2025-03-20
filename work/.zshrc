# pure prompt - https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# oh-my-zsh
# oh-my-zsh is useful even without the themes for e.g. making ls show
# colors nicely
export ZSH="$HOME/.oh-my-zsh"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh

alias src="source ~/.zshrc"
export TERM="xterm-256color"
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Make vim default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# Virtualenvwrapper
#export WORKON_HOME="${HOME}/virtualenvs"
#source ${HOME}/.local/bin/virtualenvwrapper.sh

# enable programmable completion features
if [ -f /etc/bash_completion.d/g4d ]; then
    source /etc/bash_completion.d/g4d
fi

# Flutter
export PATH=${HOME}/dev/flutter/bin:$PATH

# For libs installed with pipx?
# Maybe I also want /usr/local/bin ?
export PATH=${HOME}/.local/bin:$PATH

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
