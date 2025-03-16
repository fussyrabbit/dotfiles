# Dotfiles

This repository automates the installation and management of dotfiles, Homebrew packages, and the Pure prompt using Bash scripts and a Makefile.

## Features

- Install and delete Homebrew packages.
- Install and delete the Pure prompt.
- Create, backup, restore, and delete symbolic links for dotfiles.
- Automate everything with `make` commands.

## Installation

Clone the repository:

```sh
git clone https://github.com/fussyrabbit/dotfiles.git
cd dotfiles
```

## Usage

### Using `make`

You can use the Makefile to run common tasks:

```sh
make install       # Install Homebrew packages, Pure prompt, and dotfiles
make delete        # Remove everything
make backup        # Backup existing dotfiles
make restore       # Restore dotfiles from backup
```

For specific tasks:

```sh
make packages-install  # Install Homebrew packages
make packages-delete   # Uninstall Homebrew packages
make prompt-install    # Install Pure prompt
make prompt-delete     # Remove Pure prompt
make dotfiles-install  # Install dotfiles
make dotfiles-delete   # Remove dotfiles
```

### Using `setup.sh`

Alternatively, you can execute the Bash script directly:

```sh
./setup.sh dotfiles-install  # Install dotfiles
./setup.sh dotfiles-delete   # Remove dotfiles
./setup.sh dotfiles-backup   # Backup existing dotfiles
./setup.sh dotfiles-restore  # Restore dotfiles from backup
./setup.sh brew-install      # Install Homebrew packages
./setup.sh brew-delete       # Uninstall Homebrew packages
./setup.sh prompt-install    # Install Pure prompt
./setup.sh prompt-delete     # Remove Pure prompt
```

## File Structure

- `setup.sh`: Main Bash script for managing dotfiles, Brew packages, and Pure prompt.
- `Makefile`: Provides shortcuts for running `setup.sh` commands.
- `brew_packages.txt`: List of Homebrew packages to install.
- `ghostty`, `tmux.conf`, `zshrc`, `gitconfig`, `nvim`: Dotfiles managed by the script.

## Backup & Restore

- `make backup` or `./setup.sh dotfiles-backup` saves a copy of existing dotfiles in `~/.backup`.
- `make restore` or `./setup.sh dotfiles-restore` restores backed-up dotfiles.

## License

This project is licensed under the MIT License.
