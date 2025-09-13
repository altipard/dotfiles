#!/usr/bin/env zsh
# ============================================================================
# Improved History Navigation for Zsh + McFly
# ============================================================================
# This file enhances the shell history search UX by providing:
# - Prefix-based history search with arrow keys
# - Better integration between zsh-autosuggestions and history navigation
# - Seamless McFly integration with fallback options

# ============================================================================
# History Search Configuration
# ============================================================================

# Enable pattern-based history search
setopt HIST_FIND_NO_DUPS    # Don't display duplicates when searching
setopt HIST_IGNORE_ALL_DUPS # Remove older duplicate entries from history
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from history items
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history

# ============================================================================
# Prefix-Based History Search Widget
# ============================================================================
# This allows you to type a prefix (like "ionic") and then use arrow keys
# to navigate ONLY through history entries that start with that prefix

# Custom widget for prefix-based history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# ============================================================================
# Enhanced History Navigation Keybindings
# ============================================================================

# Arrow keys for prefix-based search (what you want!)
# These will search history based on what you've already typed
bindkey "^[[A" up-line-or-beginning-search     # Up arrow
bindkey "^[[B" down-line-or-beginning-search   # Down arrow
bindkey "^[OA" up-line-or-beginning-search     # Up arrow (alternate)
bindkey "^[OB" down-line-or-beginning-search   # Down arrow (alternate)

# Also bind in vi mode for consistency
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Alternative keybindings for traditional history navigation
# Use Ctrl+P/N for traditional history browsing without prefix filtering
bindkey "^P" up-history         # Ctrl+P for previous command (no filter)
bindkey "^N" down-history       # Ctrl+N for next command (no filter)

# ============================================================================
# History Substring Search (Optional Enhancement)
# ============================================================================
# If you want even more powerful search (match anywhere in command, not just prefix)
# uncomment the following section after installing zsh-history-substring-search

# Check if zsh-history-substring-search is installed
if [[ -f /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]]; then
  source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

  # Bind Option+Arrow keys for substring search
  bindkey "^[^[[A" history-substring-search-up    # Option+Up
  bindkey "^[^[[B" history-substring-search-down  # Option+Down

  # Configure colors for matches
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=black,bold'
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
  HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'  # Case insensitive
fi

# ============================================================================
# McFly Integration Enhancement
# ============================================================================
# Keep McFly on Ctrl+R but ensure it doesn't conflict

# Only configure if McFly is available
if command -v mcfly &> /dev/null; then
  # McFly should handle Ctrl+R (already configured in your zshrc)
  # We just ensure it's not overridden here

  # Optional: Add alternative binding for McFly
  bindkey "^[r" mcfly-history-widget  # Option+R as alternative
fi

# ============================================================================
# Zsh Autosuggestions Integration
# ============================================================================
# Better integration with zsh-autosuggestions for smoother UX

if [[ -n "$ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE" ]]; then
  # Additional bindings for autosuggestions
  bindkey '^[[C' forward-char        # Right arrow accepts one character
  bindkey '^[^[[C' forward-word      # Option+Right accepts one word
  bindkey '^[f' forward-word         # Alt+F accepts one word

  # End key accepts the full suggestion
  bindkey '^[[F' end-of-line         # End key
  bindkey '^[OF' end-of-line         # End key (alternate)
fi

# ============================================================================
# Visual Feedback for History Mode
# ============================================================================
# Optional: Show mode indicator when searching history

# Function to show current search mode
function history-search-mode-indicator() {
  if [[ -n "$BUFFER" ]]; then
    echo -n "%{$fg[yellow]%}[history: ${BUFFER}*]%{$reset_color%} "
  fi
}

# ============================================================================
# Debug Helper (can be removed once everything works)
# ============================================================================
# Uncomment to debug keybindings
# bindkey -L | grep -E "(history|line-or)"

echo "✓ Improved history navigation loaded successfully"
echo "  • Use ↑/↓ arrows for prefix-based history search"
echo "  • Use Ctrl+R for McFly fuzzy search"
echo "  • Use Ctrl+P/N for traditional history browsing"