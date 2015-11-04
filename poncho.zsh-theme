# An RDM Theme called Poncho by Ed Heltzel (http://rainydaymedia.net)
# Use with iTerm 2 - the kitkat color scheme (https://github.com/zdj/themes)
# Regular Font - 12pts Source Code Pro Non-ASCII Font - 12pt Source Code Pro Powerline
# Borrowing shamelessly from these oh-my-zsh themes: robbyrussell, fino, eastwood and lots of borrowed shit from the the inner-webs
# Meant for those who use rvm, rbenv and git, mercurial, bazaar

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  echo '◇'
}

# You can set your computer name in the ~/.box-name file if you want.

# function box_name {
#     [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
# }

if [[ -s ~/.rvm/scripts/rvm ]] ; then
  RPS1="%{$fg[yellow]%}rvm:%{$reset_color%}%{$fg[red]%}\$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $EPS1"
else
  if which rbenv &> /dev/null; then
    RPS1="%{$fg[yellow]%}rbenv:%{$reset_color%}%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$reset_color%} $EPS1"
  fi
fi

local rvm_ruby='$(rvm-prompt i v g)%{$reset_color%}'
local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'


PROMPT="╭─ %{$terminfo[bold]$FG[033]%}${current_dir}%{$reset_color%}${git_info} %{$FG[255]%}%{$FG[255]%}
╰─$(virtualenv_info)$(prompt_char)%{$reset_color%} "


#-------------------------------------------------------------------------------------
# UNCOMMNET IF YOU WANT TO INCLUDE YOUR USER AND HOST IN YOUR PROMPT - JUST LIKE FINO
#-------------------------------------------------------------------------------------
# PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info} %{$FG[239]%}using%{$FG[243]%} ${rvm_ruby}
# ╰─$(virtualenv_info)$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}[git: %{$reset_color%}%{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$FG[239]%}]%{$reset_color%}%"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[160]%} ✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"

RPROMPT=%{$fg[yellow]%}‹rvm:%{$reset_color%}%{$FG[239]%}%{$fg[red]%}${rvm_ruby}%{$fg[yellow]%}›%{$reset_color%}
