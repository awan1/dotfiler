alias l='ls'
alias la='ls -a'
alias ll='ls -lah'

alias clr='clear'
alias duh='du -h'
alias f='find'
alias md='mkdir'
alias t='touch'
alias p='pwd'
alias v='vim -p'

alias m='make'

alias py='python'
alias ipy='ipython'
alias ip='ipython --pylab'
alias nb='jupyter notebook'

# Git
alias g='git'
alias gs='g status -sb'
alias gl='g log --oneline --decorate'
alias gpl='g pull --ff-only'
alias gps='g push'
alias gpso='gps origin'
alias gpsuo='gps -u origin'  # For setting upstream branch on origin
alias gc='g commit'
alias gcm='gc -m'
alias gcl='g clone'
alias ga='g add'
alias gaa='g add -A'
alias gb='g branch'
alias gbr='gb -r'
alias gba='gb -a'
alias gbd='gb -d'
alias gbD='gb -D'
function gbdps () { gbd "$@" && gpso :"$@" }
alias gch='g checkout'
alias gchb='gch -b'
function gchbpsuo () { gchb "$@" && gpsuo "$@" }
alias gd='g diff --submodule'
function gds () { gd "$@" --stat }
alias gf='g fetch'
alias gfap='gf --all --prune'
alias gfo='gf origin'
alias gm='g merge'
alias gst='g stash'
alias gstp='gst pop'
alias gsub='g submodule'
alias gr='g reset'
alias grb='g rebase'
alias grbi='grb -i'
alias grbc='grb --continue' 

function cs () { cd "$@" && l }
function ca () { cd "$@" && la }
function cl () { cd "$@" && ll }
alias c='cs'
function cr () { clear && c "$@" }
function mk () { mkdir "$@" && c "$@" }

alias cD="c $HOME/Documents"
alias cG="c $HOME/Google\ Drive"

alias cpr='cp -r'
alias rmi='rm -ir'
alias rmr='rm -r'

alias pk='kill -9'

# Sphinx. Force overwrite (-f), put modules on separate pages (-e)
alias dosphinx='sphinx-apidoc -e -o . .. && make html'

export PRO="$HOME/.profile"
# Shortcut to ST3 Python snippets
export SNIP="$HOME/Library/Application Support/Sublime Text 3/Packages/User/Python"

# Dotfiles path for dot
if [ -d "$HOME/.dotfiles/bin" ] ; then
  PATH="$HOME/.dotfiles/bin:$PATH"
fi

# LaTeX
if [ -d "/usr/local/texlive/2015/bin/x86_64-darwin" ] ; then
  PATH="/usr/local/texlive/2015/bin/x86_64-darwin:$PATH"
fi

# Source work aliases if defined
if [ -f "$HOME/.aliases_work" ] ; then
  source $HOME/.aliases_work
fi

if [ -d '/Users/adrianwan/google-cloud-sdk' ] ; then
  # The next line updates PATH for the Google Cloud SDK.
  source '/Users/adrianwan/google-cloud-sdk/path.zsh.inc'
  # The next line enables shell command completion for gcloud.
  source '/Users/adrianwan/google-cloud-sdk/completion.zsh.inc'
fi

# Docker
alias dk='docker'
alias dkm='docker-machine'
alias dkmstart='dkm start default'
alias dki='dk images'
alias dkrmi='dk rmi $(dki --filter "dangling=true" -q --no-trunc)'
alias dkstart='eval $(dkm env default)'

# Cleanup function, from http://stackoverflow.com/a/32723127/2452770
dkclean(){
    echo "Removing exited containers"
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    echo "Removing unused images"
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

# Kubernetes
alias kub='kubectl'
alias kubg='kub get'
alias kubgp='kubg pods'
alias kubdel='kub delete'
alias kubd='kub describe'
alias kubc='kub create'
alias kubru='kub rolling-update'

# gcloud 
function GCswitch() {
    echo "Switching to cluster $@ and getting credentials"
    gcloud container clusters get-credentials "$@"
    gcloud config set container/cluster "$@"
}
alias GC='gcloud'
alias GCcc='GC container clusters'

# Bazel
PATH="$HOME/bin:$PATH"
# AppEngine
# If PYTHONPATH is length zero, don't want to append :$PYTHONPATH or we get an
# extra : at the end. Replace spaces in string with nothing.
APPENGINE_PATH='/usr/local/google_appengine'
# Removing this because conflicts with protobuf
# Re-adding because 3.0.0b2.post2 should fix it? 
export PYTHONPATH=${APPENGINE_PATH}
# export PYTHONPATH="${APPENGINE_PATH}:$PYTHONPATH"

