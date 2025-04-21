#!/bin/zsh

echo "\n=== Clone repository ==="
if [[ ! -e "${HOME}/.dotfiles" ]]; then
  git clone https://github.com/takepro14/dotfiles.git "${HOME}/.dotfiles"
fi

echo "\n=== Link files ==="
files=(vimrc tmux.conf zshrc gitconfig)
for file in "${files[@]}"; do
  if [[ ! -e "${HOME}/.${file}" ]]; then
    ln -sv "${HOME}/.dotfiles/${file}" "${HOME}/.${file}"
  fi
done

echo "\n=== Install zplug ==="
if [[ ! -d "${HOME}/.zplug" ]]; then
  # Ensure synchronous setup before loading plugins by not using zplug's official install script.
  git clone https://github.com/zplug/zplug "${HOME}/.zplug"
fi
source "${HOME}/.zshrc"

echo "\n=== Install packages ==="
packages=(tmux ripgrep)
for package in "${packages[@]}"; do
  if ! command -v "${package}" &>/dev/null; then
    brew install "${package}"
  fi
done
