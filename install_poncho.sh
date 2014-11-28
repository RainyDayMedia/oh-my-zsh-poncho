#!/bin/sh

echo "Creating a symlink for the RDM theme to your oh-my-zsh themes path..."

ln -f the_poncho.zsh-theme ~/.oh-my-zsh/themes/the_poncho.zsh-theme

echo "
Oh Snap! The theme is installed -> ~/.oh-my-zsh/themes/the_poncho.zsh-theme

----------------------------------------------------------------------------------

Requirements:
Vim Powerline patched font: See Powerline for vim for more info.
Z shell (zsh): See oh-my-zsh for more info.
Make sure terminal is using 256-colors mode with export TERM=\"xterm-256color\"".
