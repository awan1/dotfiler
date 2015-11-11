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
alias gd='g diff'
function gds () { gd "$@" --stat }
alias gf='g fetch'
alias gfap='gf --all --prune'
alias gfo='gf origin'
alias gm='g merge'
alias gst='g stash'
alias gstp='gst pop'
alias gr='g reset'
alias grb='g rebase'
alias grbi='grb -i'

function cs () { cd "$@" && l }
function ca () { cd "$@" && la }
function cl () { cd "$@" && ll }
alias c='cs'
function cr () { clear && c "$@" }
function mk () { mkdir "$@" && c "$@" }

alias cpr='cp -r'
alias rmi='rm -ir'
alias rmr='rm -r'

# Sphinx. Force overwrite (-f), put modules on separate pages (-e)
alias dosphinx='sphinx-apidoc -e -o . .. && make html'

export PRO='$HOME/.profile'

# Dotfiles path for dot
if [ -d "$HOME/.dotfiles/bin" ] ; then
  PATH="$HOME/.dotfiles/bin:$PATH"
fi

# Source work aliases if defined
if [ -f "$HOME/.aliases_work" ] ; then
  source $HOME/.aliases_work
fi
