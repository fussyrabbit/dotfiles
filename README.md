## dotfiles repo
### Quick start
Run the follofing command:
```bash
curl -sS https://starship.rs/install.sh | sh && \
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions && \
git clone git@github.com:fussyrabbit/dotfiles.git && \
cd dotfiles && stow --target=$HOME */
```
