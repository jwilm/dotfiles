# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"
#

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

OH_MY_ZSH=$ZSH/oh-my-zsh.sh
if [[ -e $OH_MY_ZSH ]] ; then
    source $ZSH/oh-my-zsh.sh
else
    echo "oh-my-zsh is not installed"
fi

# User configuration

# export PATH="/Users/jwilm/.rvm/gems/ruby-2.1.0/bin:/Users/jwilm/.rvm/gems/ruby-2.1.0@global/bin:/Users/jwilm/.rvm/rubies/ruby-2.1.0/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/jwilm/bin:/Users/jwilm/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias gsl="git --no-pager stash list"

export PS1="%n@%M ${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%~ % %{$reset_color%} "

export EDITOR=vim

# Android stuff
export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/android-sdk-linux/tools
export PATH=$PATH:/usr/local/android-sdk-linux/platform-tools
export PATH=$PATH:/usr/local/android-ndk

# Local pip installs
export PATH=$HOME/Library/Python/2.7/bin:$PATH
# rbenv
export PATH=$HOME/.rbenv/bin:$PATH

# Ag alias
alias ag='ag --ignore tags'

ff() {
    find . -type f -iname "*$1*"
}

if [ "$(uname)" = "Linux" ] ; then
  xset r rate 250 60
fi

LOCAL_CONFIG=$HOME/.dotfiles/private
if [ -e $LOCAL_CONFIG ]
then
    source $LOCAL_CONFIG
fi

cclear() {
    clear && tmux clear-history
}

# Activate rbenv
eval "$(rbenv init -)"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# ------------------------------------------------------------------------------
# Read escape sequences from terminfo
# http://zshwiki.org/home/zle/bindkeys#reading_terminfo
# ------------------------------------------------------------------------------

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

alias gbl="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(refname:short) %(color:yellow)%(objectname:short)%(color:reset) [%(color:green)%(committerdate:relative)%(color:reset)]'"
alias gblr="git for-each-ref --sort=committerdate 'refs/remotes/*' --format='%(HEAD) %(refname:short) %(color:yellow)%(objectname:short)%(color:reset) [%(color:green)%(committerdate:relative)%(color:reset)]'"

OSCAPATH=$HOME/ca/intermediate

function gen_private_key() {
    local name=$1
    local bits=$2

    # bits argument is optional
    if [[ "$bits" == "" ]];
    then
        bits="2048"
    fi

    pushd $OSCAPATH
    openssl genrsa -out private/$name.key.pem $bits
    popd
}

function gen_csr() {
    local name=$1
    pushd $OSCAPATH
    openssl req -config openssl.cfg \
        -key private/$name.key.pem \
        -new -sha256 \
        -out csr/$name.csr.pem
    popd
}

function sign_csr() {
    local name=$1
    local kind=$2

    pushd $OSCAPATH
    openssl ca -config openssl.cfg \
        -extensions $kind \
        -days 375 -notext -md sha256 \
        -in csr/$name.csr.pem \
        -out certs/$name.cert.pem
    popd
}

function sign_usr_csr() {
    sign_csr $1 "usr_cert"
}

function sign_server_csr() {
    sign_csr $1 "server_cert"
}

# Packaging
export DEBFULLNAME="Joe Wilm"
export DEBEMAIL="joe@jwilm.com"

# ------------------------------------------------------------------------------
# Syntax Highlighting
# ------------------------------------------------------------------------------

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta'

source ~/.cargo/env

# This must come last in the zshrc.
source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

export PATH=/usr/local/intellij_idea/bin:$PATH


PATH="/home/jwilm/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/jwilm/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jwilm/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jwilm/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jwilm/perl5"; export PERL_MM_OPT;

### ZNT's installer added snippet ###
#fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
#autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
#autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
#alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
#alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
#zle -N znt-history-widget
#bindkey '^R' znt-history-widget
#setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
#zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###
