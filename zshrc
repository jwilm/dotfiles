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
DISABLE_AUTO_TITLE="true"

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
alias vim="vim -g"

export PS1="%n@%M ${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%~ % %{$reset_color%} "

# Update path

# Android stuff
export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/android-sdk-linux/tools
export PATH=$PATH:/usr/local/android-sdk-linux/platform-tools
export PATH=$PATH:/usr/local/android-ndk

# Local pip installs
export PATH=$HOME/Library/Python/2.7/bin:$PATH

# Ag alias
alias ag='ag --ignore tags'

ff() {
    find . -type f -iname "*$1*"
}

if [ "$(uname)" = "Linux" ] ; then
  export TERM="xterm-256color"
  xset r rate 250 100
fi

LOCAL_CONFIG=$HOME/.dotfiles/private
if [ -e $LOCAL_CONFIG ]
then
    source $LOCAL_CONFIG
fi

cclear() {
    clear && tmux clear-history
}

source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
