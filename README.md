# Dotfiles

This repository automates the installation and management of dotfiles, Homebrew packages, and the Pure prompt using Bash scripts, Chezmoi, and a Makefile.

## Features

- Install and delete Homebrew packages.
- Install and delete the Pure prompt.
- Manage dotfiles with [Chezmoi](https://www.chezmoi.io/) (auto-installed to `~/.local/bin` if missing).
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
make delete        # Remove Homebrew packages and Pure prompt
```

For specific tasks:

```sh
make packages-install  # Install Homebrew packages
make packages-delete   # Uninstall Homebrew packages
make prompt-install    # Install Pure prompt
make prompt-delete     # Remove Pure prompt
make dotfiles-install  # Install dotfiles via Chezmoi
```

### Using `setup.sh`

Alternatively, you can execute the Bash script directly:

```sh
./setup.sh dotfiles-install  # Apply dotfiles with Chezmoi
./setup.sh brew-install      # Install Homebrew packages
./setup.sh brew-delete       # Uninstall Homebrew packages
./setup.sh prompt-install    # Install Pure prompt
./setup.sh prompt-delete     # Remove Pure prompt
```

`setup.sh` automatically installs Chezmoi to `~/.local/bin` if it's not already available. Ensure this directory is in your `PATH`.

## License

Apache 2.0
