. "$( brew --prefix idk-core )/profile.bash"
eval "$(hub alias -s)"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jake.wood/.oh-my-zsh
. ~/.secrets
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git)

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

chuck() {
  curl --silent http://api.icndb.com/jokes/random | python -c """
try:
  import sys, json
  from HTMLParser import HTMLParser as h
  print h().unescape(json.load(sys.stdin)['value']['joke'])
except:
  print 'Chuck Norris bashed your bash profile. No facts available.'
""" | say
}

ldap () {
	export LDAP_PASSWORD="$( ac-password get ldap )"
	echo "LDAP exported"
}

syncgeth () {
  echo 'Rinkeby syncing in background.\n"screen -x geth" to see progress.\nCTRL+a+d to toggle away.'
  screen -dmS geth geth --rinkeby --syncmode "fast" --rpc --rpcapi db,eth,net,web3,personal --cache=1024 --rpcport 8545 --rpcaddr 127.0.0.1 --rpccorsdomain "*"
}

alias sz="source ~/.zshrc && echo 'zshrc sourced'"
alias vz="nvim ~/.zshrc"
alias vt="nvim ~/.tmux.conf"
alias vi='nvim'
alias vv="nvim ~/.config/nvim/init.vim"
alias wo="cd ~/Documents/works"
alias hours="python ~/timesheet.py"
alias dt="cd ~/Desktop"
alias dv="cd ~/Development"
alias swp="echo \"ls ~/.local/share/nvim/swap/\" && ls ~/.local/share/nvim/swap/"
alias vmrun="/Applications/VMware\ Fusion.app/Contents/Library/vmrun"
export DEB_PATH=~/Documents/Virtual\ Machines.localized/Debian\ 6\ 64-bit.vmwarevm
alias vm="vmrun -T fusion start \$DEB_PATH"
alias vmls="echo 'vmrun -T fusion start \$DEB_PATH'"

export testnet=~/Library/Ethereum/testnet/geth.ipc
export rinkeby=~/Library/Ethereum/rinkeby/geth.ipc
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export NVM_DIR="/Users/jake.wood/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
