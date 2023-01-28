# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$(yarn global bin):$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# captricity / docker
export ROOT=~/cato

# . ~/.gitrc # exports github token
# . ~/.secrets

export WORKON_HOME=$HOME/.virtualenvs

source ~/.iterm2_shell_integration.zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status virtualenv)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-pages
  zsh-autosuggestions
  vi-mode
  zsh-syntax-highlighting
)
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
filter(){
  svn status | grep ^"$1" | awk '{print $2}' | xargs "${@:2}"
}

gbv() {
  git branch | grep "^ " | awk '{print "git branch -d " $1}' | vi
  # :%w !bash
}

svndiff () { svn diff $@ | colordiff | less -R; }

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

npmreg() {
  if [ "$1" = "apple" ]; then
    T1="https://npm.apple.com/"
  else
    T1="https://registry.npmjs.org/"
  fi
  npm config set registry "$T1"
  npm config get registry
}

runtsserver() {
    SERVER_LIVE=$(ps aux | grep -o bin.tsserver | wc -l)
    if [ $SERVER_LIVE = "1" ]; then
        echo "starting tsserver in background..."
        tsserver &
    fi
}

chuck() {
  curl --silent http://api.icndb.com/jokes/random | python3 -c """
try:
  import sys, json
  print(json.load(sys.stdin)['value']['joke'])
except:
  print('Chuck Norris bashed your bash profile. No facts available.')
""" | say
}

cpnotes() {
    cb >> $ROOT/notes/$1.txt
}

pipd() {
    pip install $1
    pip freeze > requirements.txt
}

find_children_images () {
  # input is image tag
  docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=$1 -q)
}

gbdo () {
  # bulk git branch operation with startswith filter
  # e.g. `gitdo -d cf-` will `git branch -d` against all branches that start with "cf-"
  git branch | grep ^\ \ $2 | xargs git branch $1
}

gn () {
  git branch | grep "^ " | head -n $1 | tail -n 1
}

gbn () {
  gn $1 | xargs git branch $2
}

gcn () {
  gn $1 | xargs git checkout
}

#renew_token () {
  #if [ "$1" = "" ]; then
    #mix core.tenant user-list
  #else
    #mix authx.key acc $1 | grep bearer | cb
  #fi
#}

renew_token () {
  UUID=$(mix core.tenant user-list | grep ${1:-auth} | head -n 1 | awk '{print $1}')
  if [ "$UUID" = "" ]; then
    echo "No user found"
  else
    TOKEN=$(mix authx.key acc $UUID | grep bearer)
    echo $TOKEN | pbcopy
    echo "token copied to clipboard: $TOKEN"
  fi
}

find_replace_all() {
  ag $1 -l | xargs sed -i '' "s/$1/$2/g"
}

# uuidgen # generates UUID

alias sz="source ~/.zshrc && echo 'zshrc sourced'"
alias vz="nvim ~/.zshrc"
alias vt="nvim ~/.tmux.conf"
alias vi='nvim'
alias vv="nvim ~/.config/nvim/init.vim"
alias vn="nvim ~/my_notes"
alias nag="noglob ag"

alias wo="cd ~/Documents/work"
alias dt="cd ~/Desktop"
alias dv="cd ~/Development"
alias db="cd ~/Dropbox"

alias cato="cd $ROOT"
alias dc="docker-compose"
alias be="cd $ROOT/adi-backend"
alias fe="cd $ROOT/adi-frontend"

alias sp="svn diff --internal-diff >"
alias ap="patch -p0 -i"

alias swp="echo \"ls ~/.local/share/nvim/swap/\" && ls ~/.local/share/nvim/swap/"
alias tm="tmux attach -t base || tmux new -s base"
alias npmls="npm list -g --depth 0"
alias pd=pretty-diff
alias gk="python ~/.mfa/getkey.py"
alias giri="cd $GIRI_HOME/giri; workon giri; source ~/.giri_profile"
alias imsprod="giri; ./manage.py ssh -P imsprod celery-01"
alias shreddrproduction="giri && ./manage.py ssh -P shreddrproduction celeryblank-02"
alias cipherproduction="giri && ./manage.py ssh -P cipherproduction celeryblank-01"
alias gbb="git branch | bat"
alias notes="cd $ROOT/notes"

alias dial="mix compile && MIX_ENV=test mix dialyzer --ignore-exit-status --format short | tail -n 2"
alias da="$ROOT/adi-stack/bin/da"
alias tac="bat $ROOT/notes/tachyons.css"
alias tac2="bat $ROOT/notes/v2/tachyons.css"

alias elix="elixir --name adiweb-svc@127.0.0.1 --cookie nomnom -S mix phx.server"
alias iexpry="iex --name adiweb-cli@127.0.0.1 --cookie nomnom --remsh adiweb-svc@127.0.0.1"

alias ll='ls -lha'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias fryse="/Users/jakew/.mix/escripts/fryse"
# pwgen -y -s 15 1
# openssl rand -base64 15

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
    # Load rupa's z if installed
    [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/jakew/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

runtsserver # starts typescript linting server in background

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export PATH=/Users/jakew/.local/bin:$PATH
export ERL_AFLAGS="-kernel shell_history enabled"
export CHUMAK_CURVE_LIB="enacl"

[ -f "/Users/jakew/.ghcup/env" ] && source "/Users/jakew/.ghcup/env" # ghcup-envexport PATH="/usr/local/opt/ruby/bin:$PATH"
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3
