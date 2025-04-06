# ~~~~~~~~~~~~~~~ Environment ~~~~~~~~~~~~~~~~~~~~~~~~


# Set to superior editing mode

set -o vi

export VISUAL="nvim"
export EDITOR="nvim"


# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~


HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don"t save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don"t save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions


# ~~~~~~~~~~~~~~~ Directory ~~~~~~~~~~~~~~~~~~~~~~~~


fpath+=(/opt/homebrew/Cellar/node/23.7.0/bin/node)

export WORK="${HOME}/work"
export PROJECTS="${HOME}/project"
export HOMELAB="${PROJECTS}/homelab"
export REPOS="${PROJECTS}/repos"
export DOTFILES="${PROJECTS}/repos/dotfiles"
export NOTES="${HOME}/Documents/Obsidian"


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

PURE_GIT_PULL=0

fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~


alias v="nvim"
alias tmp="cd /tmp"
alias c="clear"
alias e="exit"
alias reload-zsh="source ~/.zshrc"

# Git

alias gst="git status"
alias gd="git diff"
alias ga="git add"
alias gaa="git add -A"
alias gr="git restore --staged"
alias gc="git commit"
alias gp="git push"
alias gcmsg="git commit -am"
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# ls 

alias ls="ls --color=auto"
alias la="ls -lathr"

# Kubernetes

alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"
alias kgp="kubectl get pods"

alias f="flux"
alias t="talosctl"

# Directory

alias lab="cd $HOMELAB"
alias dot="cd $DOTFILES"
alias repos="cd $REPOS"
alias work="cd $WORK/cloud"
alias notes="cd $NOTES"

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~


# Exec bash in docker container
function dexec() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a container ID or name."
     return 0
 fi

 docker exec -it $1 bash
 return 0
}

# Show certificate data
function certdata() {
 if [[ ! "$1" ]] ; then
     echo "You must specify cerificate in PEM format"
     return 0
 fi
 openssl x509 -in "$1" -text -noout
 return 0
}

# Connect to host and show certificate information
function certconnect() {
 if [[ ! "$1" ]] ; then
     echo "You must specify hostname for SSL checking"
     return 0
 elif [[ ! "$2" ]] ; then
     echo "You must specify port for connect"
     return 0
 fi
 echo -n | openssl s_client -connect "$1":"$2" -servername "$1" 2>&1 | sed -ne "/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p" | openssl x509 -text -noout
 return 0
}


# ~~~~~~~~~~~~~~~ Completions ~~~~~~~~~~~~~~~~~~~~~~~~


if [[ ! -d ~/.zsh/func ]]; then
  mkdir -p ~/.zsh/func
fi

fpath+=~/.zsh/func

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select

completion_tools=("talosctl" "oc" "flux")

for tool in "${completion_tools[@]}"; do
  "$tool" completion zsh > ~/.zsh/func/_$tool
done


# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~


source ~/.privaterc

source <(fzf --zsh)
autoload -Uz compinit && compinit
