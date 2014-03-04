# RDM theme by Ed Heltzel (http://rainydaymedia.net)
# Use with a iterm 2 - kitkat color scheme (https://github.com/zdj/themes)
# Regular Font - 12pt Inconsolata for Powerline Non-ASCII Font - 12pt Menlo Regular for Powerline
# Meant for those who use rvm, rbenv and git, mercurial, bazaar

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira, robbyrussell, fino, eastwood
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# copied from https://gist.github.com/4415470
# Adapted from code found at <https://gist.github.com/1712320>.

#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[white]%} %{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[white]%} %{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}⬆%{$reset_color%} "
GIT_PROMPT_BEHIND="%{$fg[cyan]%}⬇%{$reset_color%} "
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%F{yellow}✭ "
GIT_PROMPT_MODIFIED="%F{blue}✹ "
GIT_PROMPT_ADDED="%{$fg_bold[green]%}✚%{$reset_color%} "
# Git prompt configuration
GIT_PROMPT_DIRTY="%{$FG[160]%} ✘"
GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"

# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
function parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_ADDED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# Checks if working tree is dirty
git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "$GIT_PROMPT_DIRTY"
  else
    echo "$GIT_PROMPT_CLEAN"
  fi
}

# If inside a Git repository, print its branch and state
function git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "%{$FG[239]%}\ue0a0 %{$fg[white]%}${git_where#(refs/heads/|tags/)}$(git_dirty)$(parse_git_state)"
}

# determine Ruby version whether using RVM or rbenv
# the chpwd_functions line cause this to update only when the directory changes
function _update_ruby_version() {
    typeset -g ruby_version=''
    if which rvm-prompt &> /dev/null; then
      ruby_version="$(rvm-prompt i v g)"
    else
      if which rbenv &> /dev/null; then
        ruby_version="$(rbenv version | sed -e "s/ (set.*$//")"
      fi
    fi
}
chpwd_functions+=(_update_ruby_version)

# Determine if we are using a gemset.
function rvm_gemset() {
    GEMSET=`rvm gemset list | grep '=>' | cut -b4-`
    if [[ -n $GEMSET ]]; then
        echo "%{$fg[yellow]%}rvm:$GEMSET%{$reset_color%}"
    fi

}

function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

PROMPT='
╭─ $FG[033]%}$(current_pwd)%{$reset_color%} $(git_prompt_string)
╰─$(prompt_char) '

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "

RPROMPT='${PR_GREEN}$(virtualenv_info)%{$reset_color%} $(rvm_gemset) %{$reset_color%}%{$fg[red]%}${ruby_version}%{$reset_color%}'
