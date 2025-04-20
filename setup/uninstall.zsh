#!/bin/zsh

# Remove repository
if [[ -e "${HOME}/.dotfiles" ]]; then
  rm -rf "${HOME}/.dotfiles"
fi

# Unlink files
[[ -e "${HOME}/.vimrc" ]] && rm "${HOME}/.vimrc"
[[ -e "${HOME}/.tmux.conf" ]] && rm "${HOME}/.tmux.conf"
[[ -e "${HOME}/.zshrc" ]] && rm "${HOME}/.zshrc"
[[ -e "${HOME}/.gitconfig" ]] && rm "${HOME}/.gitconfig"

# Uninstall zplug
if [[ -d "${HOME}/.zplug" ]]; then
  rm -rf "${HOME}/.zplug"
fi

# Uninstall tmux
if command -v tmux &>/dev/null; then
  brew uninstall tmux
fi
