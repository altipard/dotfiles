# ============================================================================
# Enhanced Configuration Integration
# ============================================================================
# Add these lines to your existing zshrc to integrate the new features
# without overwriting your current settings

# Source enhanced configurations (only if files exist)
[ -f "$HOME/.dotfiles/zsh/enhanced-settings.zsh" ] && source "$HOME/.dotfiles/zsh/enhanced-settings.zsh"
[ -f "$HOME/.dotfiles/zsh/enhanced-aliases.zsh" ] && source "$HOME/.dotfiles/zsh/enhanced-aliases.zsh"
[ -f "$HOME/.dotfiles/zsh/theme-config.zsh" ] && source "$HOME/.dotfiles/zsh/theme-config.zsh"

# Note: Add the above lines to your existing ~/.dotfiles/zsh/zshrc file
# This way you keep all your current settings and just add the enhancements