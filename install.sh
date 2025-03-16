#!/bin/bash

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing packages from Brewfile..."
brew bundle --file=~/.config/Brewfile

echo "Symb linking .zshrc" 
ln -s ~/.config/zsh/.zshrc ~/.zshrc

echo "Symb linking .aerospace.toml" 
ln -s ~/.config/aerospace/.aerospace.toml ~/.aerospace.toml

echo "Installation complete!"
