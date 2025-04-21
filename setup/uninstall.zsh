#!/bin/zsh

echo "\n=== Remove repository ==="
if [[ -e "${HOME}/.dotfiles" ]]; then
  rm -rf "${HOME}/.dotfiles"
fi

echo "\n=== Unlink files ==="
files=(vimrc tmux.conf zshrc gitconfig)
for file in "${files[@]}"; do
  if [[ -e "${HOME}/.${file}" ]]; then
    rm "${HOME}/.${file}"
  fi
done

echo "\n=== Uninstall zplug ==="
if [[ -d "${HOME}/.zplug" ]]; then
  rm -rf "${HOME}/.zplug"
fi

echo "\n=== Uninstall packages ==="
packages=(tmux ripgrep)
for package in "${packages[@]}"; do
  if command -v "${package}" &>/dev/null; then
    brew uninstall "${package}"
  fi
done
