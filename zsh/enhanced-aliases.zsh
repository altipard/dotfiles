# Enhanced aliases that complement existing ones
# Source this file from your main zshrc

# Advanced Git aliases with fzf integration (requires fzf)
if command -v fzf &> /dev/null; then
  alias gafzf='git ls-files -m -o --exclude-standard | grep -v "__pycache__" | fzf -m --print0 | xargs -0 -o -t git add'
  alias grmfzf='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git rm'
  alias grfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore'
  alias grsfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore --staged'
  alias gcofzf='git branch | fzf | xargs git checkout'
fi

# Enhanced Git aliases
alias gss='git status -s'
alias gup='git fetch && git rebase'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias glo='git pull origin'
alias gbr='git branch -r'
alias gre='git remote'
alias gres='git remote show'
alias glgg='git log --graph --max-count=5 --decorate --pretty="oneline"'
alias gpo='git push origin'
alias gcmnv='git commit --no-verify -m'

# System aliases
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'
alias sleep='pmset sleepnow'
alias c='clear'
alias e='exit'

# Development aliases
alias lg='lazygit'
alias lzd='lazydocker'
alias weather='curl wttr.in'
alias myip='curl ipinfo.io/ip'

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"

# Directory navigation
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Suffix aliases (open files with specific programs)
alias -s {js,json,ts,tsx,jsx}=nvim
alias -s {md,txt,yaml,yml}=nvim
alias -s {pdf}=open
alias -s {png,jpg,jpeg,gif}=open
