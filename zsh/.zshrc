autoload -U colors && colors

eval $(ssh-agent -s)
eval "$(starship init zsh)"

# Git aliases
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gaa='git add -A'
alias gr='git restore --staged'
alias gc='git commit'
alias gpull='git pull --rebase'
alias gpush='git push'
alias gcmsg='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
# Base aliases
alias ls='ls -a --color=auto'
alias ll='ls -ahl --color=auto'
alias tmp='cd /tmp'

# Environment
EDITOR="vim"
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=5000

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
 echo -n | openssl s_client -connect "$1":"$2" -servername "$1" 2>&1 | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | openssl x509 -text -noout
 return 0
}

[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh