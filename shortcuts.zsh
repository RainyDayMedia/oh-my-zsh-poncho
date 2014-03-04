# -------------------------------------------------------------------
# MY STUFF
# -------------------------------------------------------------------
export EDITOR='subl -w' # EDIT WITH SUBLIME TEXT

alias update="brew update && brew upgrade brew-cask && brew cleanup"

alias cl='clear'
alias ping-="ping -c 5"
alias del="rm -Rf"
alias myz="~/Projects/Forks/themes/shell/omz/omz_setup && l" # OPEN REPO
alias cuts="subl ~/Projects/Forks/themes/shell/omz/omz_setup/shortcuts.zsh"
alias funz="subl ~/Projects/Forks/themes/shell/omz/omz_setup/functions.zsh"
alias profile="subl .zshrc"

alias editssh='subl .ssh/known_hosts' # EDIT SSH HOSTS
alias copyssh='pbcopy < ~/.ssh/id_rsa.pub && echo "SSH Key copied to clipboard"' # COPY SSH PUBLIC KEY

# FORKED REPOS
alias forks="~/Projects/Forks && l"
alias themes="~/Projects/Forks/themes && l"

alias samples="~/Projects/_samples && l"

# RDM BUILDs


# VENTRUES
alias ventures="~/Projects/Ventures && l"
alias cfd="~/Projects/Ventures/CodeForDayton && l"

# CLIENTS
alias archives="~/Projects/Archived && l"
alias cb="~/Projects/clientBuilds && l"

# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------

alias ga='git add -A'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag  -m'
alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'

# leverage an alias from the ~/.gitconfig
alias gh='git hist'
alias gt='git today'
alias glg1='git lg1'
alias glg2='git lg2'
alias glg='git lg'

 git config --global alias.logs "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# curiosities
# gsh shows the number of commits for the current repos for all developers
alias gsh="git shortlog | grep -E '^[ ]+\w+' | wc -l"

# gu shows a list of all developers and the number of commits they've made
alias gu="git shortlog | grep -E '^[^ ]'"

# -------------------------------------------------------------------
# Capistrano aliases
# -------------------------------------------------------------------

alias capd='cap deploy'



