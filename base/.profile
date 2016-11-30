## Replace ls with GNU ls + color
alias ls='gls --color=auto'
alias la='ls -a'
alias ll='ls -lah'

## ls colors
LS_COLORS="*.pyc=90:*.swp=90:$LS_COLORS"
export LS_COLORS

## Other GNU replacements
alias find='gfind'
alias f='find'

## Default ls: don't want to see .pyc files.
## Demonstrating ability to add arbitrary file globs
omit_globs=('*.pyc' 'xxx')
## Build the ignore args for the ls command
ignore_args=''
for omit_glob in ${omit_globs}; do
    ignore_args="$ignore_args --ignore=\"${omit_glob}\""
done
function l () {
    ## Set lsarg to the current directory if there were no other arguments.
    ## Allows ls with no commands to work as expected.
    lsarg=${@:-.}
    ## Build the command and run it, so that ignore_args gets properly
    ## parsed as the flags. This causes the ls output.
    lscmd="ls $lsarg ${ignore_args}"
    eval $lscmd
    ## Exit if ls failed
    if [ $? -ne 0 ] ; then return; fi
    ## Count the number of files to omit
    for omit_glob in ${omit_globs}; do
        ## Need to use the eval string again because lsarg could be a glob,
        ## and it's now a string because we used the noglob setting
        find_cmd="find ${lsarg} -maxdepth 1 -iname \"${omit_glob}\""
        ## Counts the number of excluded files; the sed command formats the
        ## output of wc by stripping leading spaces and tabs
        omit_count=$(eval $find_cmd | wc -l | sed -e 's/^[ \t]*//')
        echo_color='\033[0;90m'  # Looks like dark blue
        if [ $omit_count -gt 0 ] ; then
            ## Print output with color
            echo -e "\t${echo_color}(Omitted ${omit_count} ${omit_glob} files)"
        fi
    done
}
## Need noglob because we want to pass globs to the function without the shell
## expanding them first
alias l="noglob l"

alias clr='clear'
alias duh='du -h'
alias duhs='duh -s'  # equiv. to --depth=0
alias md='mkdir'
alias t='touch'
alias p='pwd'
alias v='vim -p'

alias m='make'

alias py='python -B'
alias ip='ipython'
alias nb='jupyter notebook'
alias venv='virtualenv'
alias dea='deactivate'

## Git
alias g='git'
alias gs='g status -sb'
alias gl='g log --oneline --decorate'
alias glb="gl --branches --graph"
alias gla="g log --pretty=format:'%C(auto)%h%d %s %Cgreen(%ad %C(bold blue)%an)%Creset' --abbrev-commit --date=short"
alias glab="gla --branches --graph"
alias gpl='g pull --ff-only'
alias gps='g push'
alias gpsf='g push --force'
alias gpso='gps origin'
alias gpsuo='gps -u origin'  # For setting upstream branch on origin
alias gc='g commit'
alias gcm='gc -m'
alias gcl='g clone'
alias ga='g add'
alias gaa='g add -A'
alias gau='g add -u'  # Only add tracked files
alias gaip='g add -ip'  # Interactive patch
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
alias gstl='gst list'
alias gsub='g submodule'
alias gsubu='gsub update'
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

## Sphinx. Force overwrite (-f), put modules on separate pages (-e)
alias dosphinx='sphinx-apidoc -e -o . .. && make html'

export PRO="$HOME/.profile"
## Shortcut to ST3 Python snippets
export SNIP="$HOME/Library/Application Support/Sublime Text 3/Packages/User/Python"

## Dotfiles path for dot
if [ -d "$HOME/.dotfiles/bin" ] ; then
  PATH="$HOME/.dotfiles/bin:$PATH"
fi

## LaTeX
if [ -d "/usr/local/texlive/2015/bin/x86_64-darwin" ] ; then
  PATH="/usr/local/texlive/2015/bin/x86_64-darwin:$PATH"
fi

## Source work aliases if defined
if [ -f "$HOME/.aliases_work" ] ; then
  source $HOME/.aliases_work
fi

if [ -d '/Users/adrianwan/google-cloud-sdk' ] ; then
  ## The next line updates PATH for the Google Cloud SDK.
  source '/Users/adrianwan/google-cloud-sdk/path.zsh.inc'
  ## The next line enables shell command completion for gcloud.
  source '/Users/adrianwan/google-cloud-sdk/completion.zsh.inc'
fi

## Docker
alias dk='docker'
alias dkm='docker-machine'
alias dkmstart='dkm start default'
alias dki='dk images'
alias dkrmi='dk rmi $(dki --filter "dangling=true" -q --no-trunc)'
alias dkstart='eval $(dkm env default)'

## Cleanup function, from http://stackoverflow.com/a/32723127/2452770
dkclean(){
    echo "Removing exited containers"
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    echo "Removing unused images"
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

## Restart docker-machine, for all problems (e.g. invalid registry)
dkmrestart(){
    dkm restart default
    echo "Doing the dkm env default command"
    dkstart
}
alias dkmregen='dkm regenerate-certs default --force'

## Kubernetes
alias kub='kubectl'
alias kubg='kub get'
alias kubgp='kubg pods'
alias kubdel='kub delete'
alias kubd='kub describe'
alias kubc='kub create'
alias kubru='kub rolling-update'
alias kubl='kub logs -f'

## gcloud
function GCswitch() {
    echo "Switching to cluster $@ and getting credentials"
    gcloud container clusters get-credentials "$@"
    gcloud config set container/cluster "$@"
}
alias GC='gcloud'
alias GCcc='GC container clusters'

## Bazel
PATH="$HOME/bin:$PATH"
## AppEngine
## If PYTHONPATH is length zero, don't want to append :$PYTHONPATH or we get an
# extra : at the end. Replace spaces in string with nothing.
APPENGINE_PATH='/usr/local/google_appengine'
## Removing this because conflicts with protobuf
## Re-adding because 3.0.0b2.post2 should fix it?
export PYTHONPATH=${APPENGINE_PATH}
## export PYTHONPATH="${APPENGINE_PATH}:$PYTHONPATH"
## Go
export GOPATH=$HOME/Documents/golang

alias j="jekyll"

## Tab size
tabs -4

## iTerm2 shell integration
source ~/.iterm2_shell_integration.`basename $SHELL`

## Java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/opt/apache-maven-3.3.9/bin:$PATH
