# An Oh-My-ZSH theme called the Rain Cout by Ed Heltzel @ginfuru
# Use with iTerm 2 - Slightly Customized [Oceanic Next](https://github.com/voronianski/oceanic-next-color-scheme)
# Regular Font - 11pt Inconsolata for Powerlines Non-ASCII Font - 13pt Inconsolata for Powerlines Powerline
# Meant for those who use rbenv and git, mercurial, svn
# Borrowing shamelessly from these oh-my-zsh themes: robbyrussell, fino, eastwood and lots of borrowed shit from the the inner-webs

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# You can set your computer name in the ~/.box-name file if you want.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# copied from https://gist.github.com/4415470
# Adapted from code found at <https://gist.github.com/1712320>.

#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_PREFIX="%{$fg[black]%} %{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[black]%} %{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[yellow]%}⬆%{$reset_color%} "
GIT_PROMPT_BEHIND="%{$fg[yellow]%}⬇%{$reset_color%} "
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}✭ "
GIT_PROMPT_MODIFIED="%{$fg[cyan]%}▲ "
GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%} "

# Git prompt configuration
GIT_PROMPT_DIRTY="%{$fg[red]%} ✘✘✘"
GIT_PROMPT_CLEAN="%{$FG[154]%} ✔"

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
  [ -n "$git_where" ] && echo "%{$FG[243]%}\ue0a0%{$fg[white]%}${git_where#(refs/heads/|tags/)}$(git_dirty)$(parse_git_state)"
}
# Present working directory
function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

local ret_status="%(?:%{$fg_bold[green]%}» :%{$fg_bold[red]%}» %s)"

PROMPT='%{$fg[magenta]%}$(current_pwd) $(git_prompt_string)%{$reset_color%}
${ret_status} '

RPROMPT='%{$fg[white]%}$(battery_pct_prompt)%{$reset_color%}' # Add the battery status to right-side of prompt -- add the oh-my-zsh battery plugin to your zshrc

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "
