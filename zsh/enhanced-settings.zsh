# Enhanced zsh settings that complement existing configuration
# Source this file from your main zshrc

# ============================================================================
# XDG Base Directory Specification
# ============================================================================
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# ============================================================================
# Enhanced History Settings
# ============================================================================
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_SPACE         # Ignore commands that start with space
setopt HIST_VERIFY               # Show command with history expansion to user before running it

# ============================================================================
# Enhanced Shell Options
# ============================================================================
setopt AUTO_CD                   # If you type foo, and it isn't a command, and it is a directory, go there
setopt AUTO_LIST                 # Automatically list choices on ambiguous completion
setopt AUTO_MENU                 # Show completion menu on successive tab press
setopt AUTO_PUSHD                # Make cd push each old directory onto the directory stack
setopt PUSHD_IGNORE_DUPS         # Don't push multiple copies of the same directory onto the directory stack
setopt EXTENDED_GLOB             # Use extended globbing syntax
setopt COMPLETE_IN_WORD          # Complete from both ends of a word
setopt ALWAYS_TO_END             # Move cursor to the end of a completed word
setopt PROMPT_SUBST              # Enable parameter expansion, command substitution, and arithmetic expansion in prompts

# ============================================================================
# Tool Integrations (only if tools are installed)
# ============================================================================

# Zoxide - smarter cd command
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

# fzf - fuzzy finder
if command -v fzf &> /dev/null; then
  # Load fzf key bindings and completion
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  
  # Enhanced fzf settings
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'head -100 {}'"
  export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"
fi

# Zsh syntax highlighting (if installed via homebrew or manually)
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Zsh autosuggestions (if installed via homebrew or manually)
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ============================================================================
# Key Bindings
# ============================================================================
# Use vim keybindings
bindkey -v

# Vi mode cursor styling
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'  # Block cursor for normal mode
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'  # Beam cursor for insert mode
  fi
}
zle -N zle-keymap-select

# Ensure beam cursor when starting zsh
zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Restore beam cursor before executing command
preexec() {
    echo -ne '\e[5 q'
}

# Enhanced key bindings
# Note: ^R is handled by McFly in zshrc, don't override it here
# bindkey '^R' history-incremental-search-backward  # Disabled - McFly handles this
bindkey '^F' forward-word
bindkey '^B' backward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
bindkey '^U' kill-whole-line

# ============================================================================
# Functions
# ============================================================================

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Quick git commit with message
gcq() {
  git add -A && git commit -m "$1" && git push
}