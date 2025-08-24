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

Install chezmoi and apply:

```sh
chezmoi init <repo-url>
chezmoi apply
```

Use `brew bundle` to install packages from the Brewfile.
