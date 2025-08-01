#!/usr/bin/env bash
# ============================================================================
# Dotfiles Installation Script
# ============================================================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Paths
DOTFILES="$HOME/.dotfiles"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
BACKUP_DIR="$HOME/.dotfiles-backup/$TIMESTAMP"
BACKUP_ZIP="$HOME/dotfiles-backup-$TIMESTAMP.zip"

# ============================================================================
# Helper Functions
# ============================================================================
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

create_backup() {
    local source="$1"
    local filename=$(basename "$source")
    
    if [[ -e "$source" && ! -L "$source" ]]; then
        mkdir -p "$BACKUP_DIR"
        cp -r "$source" "$BACKUP_DIR/$filename"
        log_info "Backed up $source to $BACKUP_DIR/$filename"
    fi
}

create_symlink() {
    local source="$1"
    local target="$2"
    local target_dir=$(dirname "$target")
    
    # Create target directory if it doesn't exist
    mkdir -p "$target_dir"
    
    # Backup existing file/directory
    create_backup "$target"
    
    # Remove existing symlink or file
    rm -rf "$target"
    
    # Create symlink
    ln -sf "$source" "$target"
    log_info "Linked $source -> $target"
}

# ============================================================================
# Backup Functions
# ============================================================================
rotate_backups() {
    local backup_pattern="$HOME/dotfiles-backup-*.zip"
    local max_backups=20
    
    # Count existing backups
    local backup_count=$(ls -1 $backup_pattern 2>/dev/null | wc -l)
    
    if [[ $backup_count -ge $max_backups ]]; then
        log_info "Rotating backups (keeping latest $max_backups)..."
        
        # Get list of backups sorted by modification time (oldest first)
        local backups_to_delete=$(ls -1t $backup_pattern 2>/dev/null | tail -n +$((max_backups + 1)))
        
        # Delete oldest backups
        for backup in $backups_to_delete; do
            rm -f "$backup"
            log_info "Removed old backup: $(basename "$backup")"
        done
    fi
}

create_full_backup() {
    log_info "Creating comprehensive backup of existing configurations..."
    
    # Rotate old backups before creating new one
    rotate_backups
    
    # Create temporary backup directory
    mkdir -p "$BACKUP_DIR"
    
    # Backup all rc files in home directory
    log_info "Backing up rc files..."
    for rcfile in $HOME/.*rc $HOME/.*profile; do
        if [[ -f "$rcfile" && ! -L "$rcfile" ]]; then
            filename=$(basename "$rcfile")
            cp "$rcfile" "$BACKUP_DIR/$filename"
            log_info "Backed up $filename"
        fi
    done
    
    # Backup .config directory
    if [[ -d "$HOME/.config" ]]; then
        log_info "Backing up .config directory..."
        mkdir -p "$BACKUP_DIR/.config"
        
        # Backup each subdirectory individually with proper error handling
        for dir in "$HOME/.config"/*; do
            if [[ -d "$dir" ]]; then
                dirname=$(basename "$dir")
                # Skip socket directories
                if [[ "$dirname" == "iterm2" ]]; then
                    log_warn "Skipping iTerm2 directory (contains sockets)"
                    continue
                fi
                
                # Check for broken symlinks
                if [[ -L "$dir" && ! -e "$dir" ]]; then
                    log_warn "Skipping broken symlink: $dirname"
                    continue
                fi
                
                cp -r "$dir" "$BACKUP_DIR/.config/" 2>&1 | while read -r line; do
                    if [[ -n "$line" ]]; then
                        log_warn "Issue backing up $dirname: $line"
                    fi
                done
                
                if [[ -d "$BACKUP_DIR/.config/$dirname" ]]; then
                    log_info "Backed up .config/$dirname"
                fi
            fi
        done
    fi
    
    # Backup other important dotfiles
    for dotfile in .gitconfig .gitignore_global .tmux.conf; do
        if [[ -f "$HOME/$dotfile" && ! -L "$HOME/$dotfile" ]]; then
            cp "$HOME/$dotfile" "$BACKUP_DIR/$dotfile"
            log_info "Backed up $dotfile"
        fi
    done
    
    # Backup .tmux directory (for existing plugins)
    if [[ -d "$HOME/.tmux" ]]; then
        log_info "Backing up .tmux directory..."
        cp -r "$HOME/.tmux" "$BACKUP_DIR/.tmux"
    fi
    
    # Create ZIP archive
    log_info "Creating ZIP archive..."
    cd "$(dirname "$BACKUP_DIR")"
    zip -r "$BACKUP_ZIP" "$(basename "$BACKUP_DIR")" > /dev/null 2>&1
    
    # Remove temporary backup directory
    rm -rf "$BACKUP_DIR"
    
    log_info "Backup completed: $BACKUP_ZIP"
    log_info "Backup size: $(du -h "$BACKUP_ZIP" | cut -f1)"
}

# ============================================================================
# Installation Functions
# ============================================================================
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        log_info "Homebrew already installed"
    fi
}

install_zsh() {
    log_info "Setting up Zsh configuration..."
    create_symlink "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"
    
    # Create .zprofile if it exists
    if [[ -f "$DOTFILES/zsh/zprofile" ]]; then
        create_symlink "$DOTFILES/zsh/zprofile" "$HOME/.zprofile"
    fi
    
    # Set Zsh as default shell if not already
    if [[ "$SHELL" != *"zsh"* ]]; then
        log_info "Setting Zsh as default shell..."
        chsh -s $(which zsh)
    fi
}

install_git() {
    log_info "Setting up Git configuration..."
    if [[ -f "$DOTFILES/git/gitconfig" ]]; then
        create_symlink "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
    fi
    
    if [[ -f "$DOTFILES/git/gitignore_global" ]]; then
        create_symlink "$DOTFILES/git/gitignore_global" "$HOME/.gitignore_global"
    fi
}

install_nvim() {
    log_info "Setting up Neovim configuration..."
    if [[ -d "$DOTFILES/nvim" ]]; then
        create_symlink "$DOTFILES/nvim" "$HOME/.config/nvim"
    fi
}

install_tmux() {
    log_info "Setting up Tmux configuration..."
    if [[ -f "$DOTFILES/tmux/tmux.conf" ]]; then
        create_symlink "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"
    fi
    
    # Install TPM (Tmux Plugin Manager) if not already installed
    if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
        log_info "Installing TPM (Tmux Plugin Manager)..."
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    else
        log_info "TPM already installed"
    fi
    
    # Install tmux plugins automatically
    if command -v tmux &> /dev/null; then
        log_info "Installing tmux plugins..."
        # Start a new tmux server, source config, and install plugins
        tmux new-session -d -s temp_install_session
        tmux send-keys -t temp_install_session "tmux source ~/.tmux.conf" Enter
        sleep 1
        # Run TPM installer (Prefix + I)
        tmux send-keys -t temp_install_session C-a I
        sleep 5  # Wait for plugins to install
        tmux kill-session -t temp_install_session
        log_info "Tmux plugins installed successfully"
    else
        log_warn "Tmux not installed. Install tmux and run: ~/.tmux/plugins/tpm/bin/install_plugins"
    fi
}

install_ghostty() {
    log_info "Setting up Ghostty configuration..."
    if [[ -f "$DOTFILES/ghostty/config" ]]; then
        create_symlink "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"
    fi
}

install_aerospace() {
    log_info "Setting up Aerospace window manager..."
    
    # Install Aerospace via Homebrew if not installed
    if ! command -v aerospace &> /dev/null; then
        log_info "Installing Aerospace..."
        brew install --cask nikitabobko/tap/aerospace
    else
        log_info "Aerospace already installed"
    fi
    
    # Link configuration
    if [[ -f "$DOTFILES/aerospace/aerospace.toml" ]]; then
        create_symlink "$DOTFILES/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
    fi
    
    # Start Aerospace service
    log_info "Starting Aerospace service..."
    aerospace list-apps &> /dev/null || log_warn "Aerospace not running. Please start it manually."
}

install_karabiner() {
    log_info "Setting up Karabiner-Elements for Meh key configuration..."
    
    # Install Karabiner-Elements via Homebrew if not installed
    if [[ ! -d "/Applications/Karabiner-Elements.app" ]]; then
        log_info "Installing Karabiner-Elements..."
        brew install --cask karabiner-elements
    else
        log_info "Karabiner-Elements already installed"
    fi
    
    # Link configuration
    if [[ -f "$DOTFILES/karabiner/karabiner.json" ]]; then
        create_symlink "$DOTFILES/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
    fi
    
    log_info "Karabiner-Elements configured. Please open it and enable the 'Aerospace Meh Key' profile."
}

install_sketchybar() {
    log_info "Setting up SketchyBar..."
    
    # Install SketchyBar via Homebrew if not installed
    if ! command -v sketchybar &> /dev/null; then
        log_info "Installing SketchyBar..."
        brew tap FelixKratz/formulae
        brew install sketchybar
    else
        log_info "SketchyBar already installed"
    fi
    
    # Install SketchyBar app font for proper app icons
    local font_path="$HOME/Library/Fonts/sketchybar-app-font.ttf"
    if [[ ! -f "$font_path" ]]; then
        log_info "Installing SketchyBar app font..."
        curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.25/sketchybar-app-font.ttf -o "$font_path"
        log_info "SketchyBar app font installed"
    else
        log_info "SketchyBar app font already installed"
    fi
    
    # Link configuration
    if [[ -d "$DOTFILES/sketchybar" ]]; then
        create_symlink "$DOTFILES/sketchybar" "$HOME/.config/sketchybar"
    fi
    
    # Start SketchyBar service
    log_info "Starting SketchyBar service..."
    brew services start sketchybar || log_warn "Could not start SketchyBar service. You may need to start it manually."
}

# ============================================================================
# Main Installation
# ============================================================================
main() {
    log_info "Starting dotfiles installation..."
    
    # Check if we're on macOS
    if [[ "$(uname)" != "Darwin" ]]; then
        log_error "This script is designed for macOS"
        exit 1
    fi
    
    # Create comprehensive backup before any changes
    create_full_backup
    
    # Install components
    install_homebrew
    install_zsh
    install_git
    install_nvim
    install_tmux
    install_ghostty
    install_karabiner
    install_sketchybar
    install_aerospace
    
    log_info "Installation complete!"
    log_info "Full backup saved at: $BACKUP_ZIP"
    log_warn "Please restart your terminal or run 'source ~/.zshrc'"
    
    # Show restore instructions
    echo ""
    log_info "To restore from backup if needed:"
    echo "  unzip $BACKUP_ZIP"
    echo "  cd $(basename "$BACKUP_DIR")"
    echo "  cp -r * ~/"
}

# Run main function
main "$@"