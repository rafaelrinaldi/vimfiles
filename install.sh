#!/bin/bash
set -e

# Prompt symbols
prompt_symbol="❯"
unicorn_symbol="🦄"
style_symbol="🎨"
warning_symbol="🚨"

# Default editor
editor="neovim"

# Do not add symbols to the output
if [ "$1" = "--no-symbols" ]; then
  prompt_symbol=">"
  unicorn_symbol=""
  style_symbol=""
  warning_symbol=""
fi

echo "$prompt_symbol Setting up Vim..."

# Create a backup of current Vim settings
mkdir -p /tmp/vim_backup

if [[ -d "$HOME/.vim" ]]; then
  sudo cp -r $HOME/.vim /tmp/vim_backup
fi

if [[ -f "$HOME/.vimrc" ]]; then
  sudo cp $HOME/.vimrc /tmp/vim_backup
fi

has_brew=`which brew`
cwd=`pwd`

upgrade_and_install_editor() {
  if [[ -z `brew upgrade $editor &> /dev/null` ]]; then
    echo -en "\r$prompt_symbol Vim is currently on the latest version available\n"
  else
    echo -en "\r$prompt_symbol Updating Vim to the latest version...\n"
    brew upgrade $editor &> /dev/null
    echo -en "\r$prompt_symbol Vim is now up to date\n"
  fi
}

# Check if user wants Neovim or Vim
echo -e "$prompt_symbol Do you wish to use Neovim? (Y/n): \c"
read should_use_neovim

if [ "$should_use_neovim" = "n" ]; then
  editor="vim"
fi

# Try to update Homebrew and the editor
if [[ -n $has_brew ]]; then
  echo -n "$prompt_symbol Looking for Vim updates..."
  brew update &> /dev/null
  upgrade_and_install_editor
else
  echo "$prompt_symbol $warning_symbol Homebrew not found, skipped Vim update"
fi

cp -r $cwd/vim $HOME/.vim
cp $cwd/vimrc $HOME/.vimrc

# Try to install Vundle if it's not installed already
if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
  echo -n "$prompt_symbol Downloading Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim" &> /dev/null
  echo -en "\r$prompt_symbol Vundle was successfully downloaded\n"
fi

echo -n "$prompt_symbol Installing Vundle plugins..."
vim +PluginInstall +qall &> /dev/null
echo -en "\r$prompt_symbol Vundle plugins were successfully installed\n"

# Default theme is solarized
theme_default="solarized"

if [ "$editor" = "neovim" ]; then
  # Create a symbolic link from the `.vimrc`
  ln -s ~/.vimrc ~/.config/nvim/init.vim
fi

echo "$prompt_symbol $unicorn_symbol Done! Your Vim is ready to go"
exit 0
