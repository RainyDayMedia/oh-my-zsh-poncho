#!/bin/sh

echo "Creating a symlink for the RDM theme to your oh-my-zsh themes path..."

ln -f the_poncho.zsh-theme ~/.oh-my-zsh/themes/the_poncho.zsh-theme &&
ln -f rain_coat.zsh-theme ~/.oh-my-zsh/themes/rain_coat.zsh-theme

echo "
Oh Snap! The themes is installed -> ~/.oh-my-zsh/themes

----------------------------------------------------------------------------------

Requirements:
Vim Powerline patched font: See Powerline for vim for more info.
Z shell (zsh): See oh-my-zsh for more info.
Make sure terminal is using 256-colors mode with export TERM=\"xterm-256color\"".
