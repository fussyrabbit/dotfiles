#!/usr/bin/env bash

set -euo pipefail
# set -x # Uncomment for debugging

brew_packages_file="brew_packages.txt"
prompt_directory="$HOME/.zsh/pure"

usage() {
  echo "Usage: $0 <action>"
  echo "Available actions: dotfiles-install, brew-install, brew-delete, prompt-install, prompt-delete"
  exit 1
}

install_brew_packages() {
  xargs -r brew install <"$brew_packages_file"
}

delete_brew_packages() {
  xargs -r brew uninstall <"$brew_packages_file"
}

manage_prompt() {
  case $1 in
  prompt-install)
    if [[ ! -d "$prompt_directory" ]]; then
      mkdir -p "$prompt_directory"
      git clone https://github.com/sindresorhus/pure.git "$prompt_directory"
      echo "Prompt installed successfully."
    else
      echo "Prompt directory already exists: $prompt_directory"
    fi
    ;;
  prompt-delete)
    if [[ -d "$prompt_directory" ]]; then
      echo "Deleting prompt directory: $prompt_directory"
      rm -rf "$prompt_directory"
    else
      echo "Prompt directory does not exist: $prompt_directory"
    fi
    ;;
  esac
}

manage_dotfiles() {
  if ! command -v chezmoi >/dev/null 2>&1; then
    echo "chezmoi is not installed. Installing..."
    tmpfile=$(mktemp)
    curl -fsSL https://raw.githubusercontent.com/twpayne/chezmoi/master/assets/scripts/install.sh -o "$tmpfile"
    bash "$tmpfile" -b /usr/local/bin
    rm -f "$tmpfile"
    command -v chezmoi >/dev/null 2>&1 || {
      echo "failed to install chezmoi"
      exit 1
    }
  fi

  case $1 in
  dotfiles-install)
    chezmoi apply --source="$PWD"
    ;;
  esac
  }

[[ -z $1 ]] && usage

case "$1" in
dotfiles-install)
  manage_dotfiles "$1"
  ;;
brew-install)
  install_brew_packages
  ;;
brew-delete)
  delete_brew_packages
  ;;
prompt-install | prompt-delete)
  manage_prompt "$1"
  ;;
*)
  echo "Unknown action: $1"
  usage
  ;;
esac
