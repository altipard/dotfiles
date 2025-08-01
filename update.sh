#!/usr/bin/env bash
# ============================================================================
# Dotfiles Update Script
# ============================================================================

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTFILES="$HOME/.dotfiles"

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# ============================================================================
# Update Functions
# ============================================================================
update_repo() {
    log_info "Updating dotfiles repository..."
    cd "$DOTFILES"
    git pull origin main
}

update_homebrew() {
    log_info "Updating Homebrew packages from Brewfile..."
    brew update
    brew bundle --file="$DOTFILES/homebrew/Brewfile" --no-lock
    brew cleanup
}

update_configs() {
    log_info "Re-running install script to update symlinks..."
    "$DOTFILES/install.sh"
}

# ============================================================================
# Main
# ============================================================================
main() {
    log_info "Starting dotfiles update..."
    
    update_repo
    update_homebrew
    update_configs
    
    log_info "Update complete!"
    log_warn "Please restart your terminal for changes to take effect"
}

main "$@"