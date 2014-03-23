#!/bin/sh

echo "Creating a symlink or rdm2 theme to your oh-my-zsh themes path..."

ln -f rdm2.zsh-theme ~/.oh-my-zsh/themes/rdm2.zsh-theme

echo "
Done ! (the symlink is ~/.oh-my-zsh/themes/rdm2.zsh-theme)

----------------------------------------------------------------------------------

Requirements:
Vim Powerline patched font: See Powerline for vim for more info.
Z shell (zsh): See oh-my-zsh for more info.
Make sure terminal is using 256-colors mode with export TERM=\"xterm-256color\"".
