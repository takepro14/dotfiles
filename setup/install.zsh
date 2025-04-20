#!/bin/zsh

# Clone repository
if [[ ! -e "${HOME}/.dotfiles" ]]; then
  git clone https://github.com/takepro14/dotfiles.git "${HOME}/.dotfiles"
else
  git -C "${HOME}/.dotfiles" pull
fi

# Link files
ln -sfv "${HOME}/.dotfiles/vimrc" "${HOME}/.vimrc"
ln -sfv "${HOME}/.dotfiles/tmux.conf" "${HOME}/.tmux.conf"
ln -sfv "${HOME}/.dotfiles/zshrc" "${HOME}/.zshrc"
ln -sfv "${HOME}/.dotfiles/gitconfig" "${HOME}/.gitconfig"

# Install zplug
if [[ ! -d "${HOME}/.zplug" ]]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ${HOME}/.zshrc

# Install tmux
if ! command -v tmux &>/dev/null; then
  brew install tmux
fi
