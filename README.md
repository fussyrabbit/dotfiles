# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). This repository stores configuration for Zsh, tmux, Neovim and other tooling.

## Highlights

- **Zsh** – defines environment variables, PATH customization, aliases for Git and Kubernetes, and completion helpers.
- **tmux** – enables mouse support, sets a 25k-line history, and customizes the status line.
- **Neovim** – ships a LazyVim-based setup located under `dot_config/nvim`.
- **Homebrew bundle** – `Brewfile` lists command-line tools like `chezmoi`, `neovim`, and `tmux` to bootstrap a macOS or Linux environment.
- **Git configuration** – templates for personal and work identities with optional include based on repository location.
- **Secrets** – sensitive environment variables sourced from Bitwarden via `rbwFields` and age-encrypted work secrets.

## Usage

Install brew packages `brew bundle install` after init chezmoi with apply:

```sh
chezmoi init --apply https://github.com/fussyrabbit/dotfiles.git
```
