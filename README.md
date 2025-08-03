# Modern macOS Development Environment

> A comprehensive, modular dotfiles collection for productive macOS development with automated setup and cutting-edge tools.

## Quick Start

```bash
# Clone and install
git clone https://github.com/daltiparmak/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh

# Update existing installation
./update.sh
```

## Configuration Components

| Component | Description | Documentation |
|-----------|-------------|---------------|
| [zsh/](zsh/README.md) | Advanced shell with enhanced aliases and integrations | [Guide](zsh/README.md) |
| [nvim/](nvim/README.md) | Modern Neovim setup with LSP and plugins | [Guide](nvim/README.md) |
| [tmux/](tmux/README.md) | Terminal multiplexer with Nordic theme | [Guide](tmux/README.md) |
| [kitty/](kitty/README.md) | GPU-accelerated terminal emulator | [Guide](kitty/README.md) |
| [starship/](starship/README.md) | Cross-shell prompt with git integration | [Guide](starship/README.md) |
| [aerospace/](aerospace/README.md) | Tiling window manager with Meh-key setup | [Guide](aerospace/README.md) |
| [karabiner/](karabiner/README.md) | Keyboard remapping for Space-key modifiers (NOT ACTIVE) | [Guide](karabiner/README.md) |
| [sketchybar/](sketchybar/README.md) | Customizable status bar replacement | [Guide](sketchybar/README.md) |
| ghostty/ | Modern terminal with native macOS integration | [Built-in docs](#ghostty) |
| homebrew/ | Package management via Brewfile | [Built-in docs](#homebrew) |

## Quick Reference

- **[Complete Cheat Sheet](CHEATSHEET.md)** - All keyboard shortcuts and commands
- **[Installation Guide](#installation)** - Detailed setup instructions
- **[Customization](#customization)** - How to modify configurations

## Installation

```bash
# Clone repository
git clone https://github.com/daltiparmak/dotfiles.git ~/.dotfiles

# Run installation
cd ~/.dotfiles
./install.sh
```

## Update

```bash
cd ~/.dotfiles
./update.sh
```

## Features

- **Modular structure**: Each component in its own folder
- **Automatic backups**: Existing configs are backed up
- **Homebrew Bundle**: All packages defined in one file
- **Symlink management**: Easy management of configuration files
- **Aerospace Window Manager**: Tiling Window Manager with Meh-Key setup
- **German keyboard optimized**: Collision-free shortcuts via Space-Bar

## Components

### Zsh
- Minimal base configuration
- Modularly expandable through `.zsh` files
- Supports local overrides via `.zshrc.local`

### Homebrew
- All packages defined in `homebrew/Brewfile`
- Automatic installation via `brew bundle`

### Aerospace Window Manager
Modern tiling window manager for macOS with workspace management.

#### Why Aerospace with Meh-Key?
On German Mac keyboards, the Option/Alt key is reserved for special characters:
- `Alt+N` = ~
- `Alt+L` = @
- `Alt+E` = €
- `Alt+8` = {
- `Alt+9` = }

The solution: **Meh-Key** (Shift+Ctrl+Alt) via the Space key!

#### Key Concept
- **Hold Space key** = Meh-Key (Shift+Ctrl+Alt)
- **Tap Space key** = Normal space
- **Right Cmd + Space** = Hyper-Key (Shift+Ctrl+Alt+Cmd)

#### Workspace Organization
Workspaces are organized by mnemonic groups:
- `Space+B` → **B**rowser (Chrome, Safari, Firefox)
- `Space+C` → **C**ode/Development (VSCode, IntelliJ)
- `Space+M` → **M**essages (WhatsApp, Mail, Slack, Teams)
- `Space+T` → **T**erminal (iTerm, Terminal, Ghostty)
- `Space+V` → **V**ideo/Virtual Meetings (Zoom, Teams)
- `Space+D` → **D**ocumentation (Obsidian, Notion)
- `Space+E` → **E**ntertainment (Spotify, YouTube)
- `Space+F` → **F**inder/Files
- `Space+G` → **G**it/GitHub Desktop
- `Space+N` → **N**otes
- `Space+P` → **P**roductivity (Calendar, Reminders)
- `Space+R` → **R**esearch (Browser for research)
- `Space+S` → **S**ystem/Settings
- `Space+U` → **U**tilities
- `Space+W` → **W**ork (work-specific apps)
- `Space+1-9` → Numeric workspaces for overflow

#### Window Management
- `Space+H/J/K/L` → Focus window (Vim-style)
- `Space+Cmd+H/J/K/L` → Move window
- `Space+Letter` → Switch to workspace
- `Space+Cmd+Letter` → Move window to workspace
- `Space+Space` → Toggle layout
- `Space+Enter` → Fullscreen
- `Space+Q` → Close window

#### Resize Mode
- `Space+;` → Activate resize mode
  - `H/J/K/L` → Change size (50px steps)
  - `Shift+H/J/K/L` → Fine adjustment (10px steps)
  - `ESC` or `Enter` → Exit resize mode

### Karabiner-Elements
Enables using the Space bar as a modifier key:
- Configuration in `karabiner/karabiner.json`
- Profile "Aerospace Meh Key" is created automatically
- Activate in Karabiner-Elements after installation

### SketchyBar
Highly customizable macOS status bar with Lua configuration:
- Fully configurable via Lua
- Supports workspaces, system monitoring, and app indicators
- Seamless integration with Aerospace Window Manager
  - Shows all AeroSpace workspaces in the status bar
  - Clickable workspace buttons for quick switching
  - Live updates of app icons in each workspace
  - Automatic detection of new/deleted workspaces
- GPU-accelerated rendering
- App icons via SketchyBar-App-Font (installed automatically)

#### Hide macOS Menu Bar
To hide the native macOS menu bar and use SketchyBar as a replacement:

1. **Open System Settings**:
   - Apple Menu → System Settings → Desktop & Dock

2. **Auto-hide menu bar**:
   - Enable "Automatically hide and show the menu bar"
   - Select "Always" from the dropdown menu

3. **Alternative via Terminal**:
   ```bash
   # Always hide menu bar
   defaults write NSGlobalDomain _HIHideMenuBar -bool true
   
   # Apply changes (restart required)
   killall Finder
   ```

4. **Undo**:
   ```bash
   # Show menu bar again
   defaults write NSGlobalDomain _HIHideMenuBar -bool false
   killall Finder
   ```

### Ghostty
Modern GPU-accelerated terminal with native macOS integration.

## Customization

1. **Local settings**: Create `~/.zshrc.local` for machine-specific configs
2. **New modules**: Place `.zsh` files in `zsh/`, they will be loaded automatically
3. **Packages**: Edit `homebrew/Brewfile` and run `./update.sh`
4. **Workspace customization**: Edit `aerospace/aerospace.toml` for custom workspace definitions
5. **Keyboard remapping**: Extend `karabiner/karabiner.json` for additional key combinations