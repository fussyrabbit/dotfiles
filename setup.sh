#!/usr/bin/env bash

# set -x # Uncomment for debugging

brew_packages_file="brew_packages.txt"
prompt_directory="$HOME/.zsh/pure"
home_config_directory="$HOME/.config"
backup_dir="$HOME/.backup"

dotfiles=(
  ".tmux.conf:$HOME/.tmux.conf"
  ".zshrc:$HOME/.zshrc"
  ".gitconfig:$HOME/.gitconfig"
  ".config:$home_config_directory"
)

usage() {
  echo "Usage: $0 <action>"
  echo "Available actions: dotfiles-install, dotfiles-delete, dotfiles-backup, dotfiles-restore, brew-install, brew-delete, prompt-install, prompt-delete"
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

manage_symlinks() {
  local action=$1
  for file in "${dotfiles[@]}"; do
    IFS=':' read -r source target <<<"$file"

    local source_file="$PWD/$source"
    local target_file="$target"
    local backup_file="$backup_dir/$source"

    case $action in
    dotfiles-install)
      if [[ -L "$target_file" ]]; then
        echo "Symlink already exists: $target_file -> $(readlink "$target_file")"
      elif [[ -e "$target_file" ]]; then
        echo "File already exists (not symlink): $target_file"
      else
        ln -s "$source_file" "$target_file"
        echo "Created symlink: $source_file -> $target_file"
      fi
      ;;
    dotfiles-delete)
      if [[ -L "$target_file" ]]; then
        rm "$target_file"
        echo "Deleted symlink: $target_file"
      elif [[ -e "$target_file" ]]; then
        echo "File exists but is not a symlink: $target_file (skipping)"
      else
        echo "File does not exist: $target_file (skipping)"
      fi
      ;;
    dotfiles-backup)
      mkdir -p "$backup_dir"
      if [[ -e "$target_file" && ! -e "$backup_file" ]]; then
        cp -r "$target_file" "$backup_file"
        echo "Backed up: $backup_file"
      fi
      ;;
    dotfiles-restore)
      if [[ -e "$backup_file" ]]; then
        cp "$backup_file" "$target_file"
        echo "Restored: $target_file"
      else
        echo "Backup not found for: $target_file"
      fi
      ;;
    esac
  done
}

[[ -z $1 ]] && usage

case "$1" in
dotfiles-install | dotfiles-delete | dotfiles-backup | dotfiles-restore)
  manage_symlinks "$1"
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
