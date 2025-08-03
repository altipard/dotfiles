# Theme configuration that works with your existing setup
# Source this file from your main zshrc

# ============================================================================
# Theme System
# ============================================================================
# You can change these themes to customize your environment
export TMUX_THEME="${TMUX_THEME:-nord}"
export NVIM_THEME="${NVIM_THEME:-nord}"
export STARSHIP_THEME="${STARSHIP_THEME:-nord}"
export KITTY_THEME="${KITTY_THEME:-nord}"

# ============================================================================
# Environment Variables for Better Tool Integration
# ============================================================================
# Better less configuration
export LESS='-R --use-color -Dd+r$Du+b$'
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Better grep colors
export GREP_COLORS='mt=1;33'

# FZF theme (Nord colors)
export FZF_DEFAULT_OPTS="
  --color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88
  --color=fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1
  --color=marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1
  --height 40% --layout=reverse --border"

# Bat theme (if bat is installed)
if command -v bat &> /dev/null; then
  export BAT_THEME="Nord"
fi

# ============================================================================
# Tool-specific configurations
# ============================================================================

# Better man pages with colors
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Use ripgrep for fzf if available
if command -v rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# ============================================================================
# Conditional Tool Loading
# ============================================================================

# Load direnv if available
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Load thefuck if available
if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

# ============================================================================
# Performance Optimizations
# ============================================================================

# Lazy load nvm to improve shell startup time
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  export NVM_DIR="$HOME/.nvm"
  nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
  }
fi