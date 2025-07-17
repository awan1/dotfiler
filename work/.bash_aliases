alias l="ls"
alias la="l -a"
alias ll="l -l"

function c () { cd "$@"; l; }
function ca () { cd "$@"; la; }
function cl () { cd "$@"; ll; }

# Directories
alias co="c ~/onduo"
alias cD="c ~/Downloads"

# Programs
alias v="vim -p"
alias nv="nvim"
# Use nvim for everything
alias vim="nv"

# CLI
alias cpr="cp -R"
alias rmr="rm -r"

# apt-get
alias sag="sudo apt-get"
alias sagi="sag install"
alias sagu="sag update"

# Bazel
alias b="bazel"
alias bb="b build --config=tidy"  # config=tidy for clang-tidy
alias bt="b test"
alias bc="b clean"
alias bbt="bb '...:*' && bt '...:*'"

# Secondary bazel, e.g. for long builds
alias b2="${HOME}/verb2/usr/bin/bazel"
alias b2b="b2 build --config=tidy"  # config=tidy for clang-tidy
alias b2t="b2 test"
alias b2c="b2 clean"
alias b2bt="b2b '...:*' && b2t '...:*'"

# Dazel
alias db="dazel build '...:*'"
alias dt="dazel test '...:*'"
alias dbt="db && dt"

# clang-format
# From danielhira. Need to use the clang-format in docker.
alias cf="dbash clang-format-verb 3.8 -i *.cc *.h"

# Repo
alias r="repo"
alias rsy="r sync"
alias rst="r start"
alias ru="echo y | r upload --current-branch"  # Automatically confirm we want to upload
alias rup="r upload"  # For when we need to interact with prompts
alias rud="ru --draft"  # Upload a draft
alias rupd="rup --draft"
alias rrb="r rebase"
alias rsyrb="r sync && r rebase ."
alias rp="r prune"
alias rc="rrb . && rp ."  # repo clean
alias ri="r info -o"
alias rch="r checkout"
alias rd="r diff"
alias rb="r branches"
alias rs="r status"

## Git
alias g='git'
alias gs='g status -sb'
alias gl='g log --oneline --decorate'
alias gl1='g log -1'  # Show last commit message
alias glb="gl --branches --graph"
alias gla="g log --pretty=format:'%C(auto)%h%d %s %Cgreen(%ad %C(bold blue)%an)%Creset' --abbrev-commit --date=short"
alias glab="gla --branches --graph"
alias gps='g push'
alias gpsf='g push --force'
alias gpso='gps origin'
alias gpsuo='gps -u origin HEAD'  # For setting upstream branch on origin
alias gc='g commit'
alias gcm='gc -m'
alias gcl='g clone --recursive'  # For getting submodules
alias ga='g add'
alias gaa='g add -A'
alias gau='g add -u'  # Only add tracked files
alias gaip='g add -ip'  # Interactive patch
alias gb='g branch'
alias gbr='gb -r'
alias gba='gb -a'
alias gbd='gb -d'
alias gbD='gb -D'
function gbdps () { gbd "$@"; gpso :"$@"; }
alias gch='g checkout'
alias gchb='gch -b'
alias gd='g diff --submodule'
function gds () { gd "$@" --stat; }
alias gdh='gd HEAD~1'
alias gdsh='gds HEAD~1'
alias gf='g fetch'
alias gfap='gf --all --prune'
alias gfo='gf origin'
alias gm='g merge'
alias gst='g stash'
alias gstp='gst pop'
alias gstl='gst list'
alias gsub='g submodule'
alias gsubu='gsub update'
alias gsubur='gsubu --remote'
alias gpl='g pull --ff-only && gsubu'
alias gr='g reset'
alias grb='g rebase'
alias grbi='grb -i'
alias grbc='grb --continue'
alias gt='g tag'
alias gca='gc --amend'
# Amend commit date to now. Useful after rebase
alias gcan='gca --date="now"'
# Bundles
alias gac='gau && gc'
alias gacm='gau && gcm'
alias gacs='gac && gps'
alias gaac='gaa && gc'
alias gaacs='gaac && gps'

# Compound git commands
# Make the given branch point to current commit and check the branch out
function gbf () { gb -f "$@" && gch "$@" }
# Update master
alias gmaster='gch master && gpl && gch -'
# Update main
alias gmain='gch main && gpl && gch -'
# Delete local branches that have been deleted on remote
function gprune () { git fetch --all -p; git branch -vv | awk '{ if ($4 == "gone]") print $1 }' | xargs -n 1 git branch -D }

# Source other stuff
if [[ -r $HOME/.bash_aliases-nosync ]]; then
    source $HOME/.bash_aliases-nosync
fi
