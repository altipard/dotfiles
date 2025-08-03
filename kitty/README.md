# Kitty Terminal Configuration

GPU-accelerated terminal emulator with OneDark theme and custom optimizations.

## Overview

Kitty provides:
- GPU-accelerated rendering for smooth scrolling
- Powerful font management and ligature support
- Customizable themes and layouts
- Advanced features like tabs, windows, and sessions
- Excellent Unicode and emoji support

## Files Structure

```
kitty/
├── kitty.conf      # Main configuration file
├── onedark.conf    # OneDark color theme
└── custom.conf     # Custom settings and overrides
```

## Key Features

### Performance
- **GPU acceleration**: Hardware-accelerated text rendering
- **Low latency**: Minimal input lag
- **Efficient scrolling**: Smooth performance with large buffers
- **Fast startup**: Quick application launch times

### Font Management
- **Ligature support**: Programming font ligatures
- **Font fallback**: Automatic fallback for missing glyphs
- **Size adjustment**: Per-window font size control
- **Weight variants**: Support for different font weights

### OneDark Theme
- **Syntax-aware colors**: Optimized for code readability
- **Consistent palette**: Matches popular editor themes
- **Eye-friendly**: Reduced strain during long coding sessions
- **High contrast**: Clear distinction between elements

## Key Bindings

### Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `Cmd+Enter` | New window | Create new window |
| `Cmd+W` | Close window | Close current window |
| `Cmd+Shift+]` | Next window | Switch to next window |
| `Cmd+Shift+[` | Previous window | Switch to previous window |
| `Cmd+1-9` | Window by number | Jump to specific window |

### Tab Management
| Key | Action | Description |
|-----|--------|-------------|
| `Cmd+T` | New tab | Create new tab |
| `Cmd+Shift+W` | Close tab | Close current tab |
| `Cmd+Shift+Right` | Next tab | Switch to next tab |
| `Cmd+Shift+Left` | Previous tab | Switch to previous tab |
| `Cmd+Alt+1-9` | Tab by number | Jump to specific tab |

### Pane Management
| Key | Action | Description |
|-----|--------|-------------|
| `Cmd+D` | Split vertical | Split pane vertically |
| `Cmd+Shift+D` | Split horizontal | Split pane horizontally |
| `Cmd+Shift+Left/Right/Up/Down` | Navigate panes | Move between panes |
| `Cmd+Ctrl+Left/Right/Up/Down` | Resize panes | Resize current pane |

### Font and Display
| Key | Action | Description |
|-----|--------|-------------|
| `Cmd++` | Increase font | Make text larger |
| `Cmd+-` | Decrease font | Make text smaller |
| `Cmd+0` | Reset font | Reset to default size |
| `Cmd+Shift+F11` | Toggle fullscreen | Full screen mode |

### Search and Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `Cmd+F` | Search | Search in scrollback |
| `Cmd+G` | Find next | Next search result |
| `Cmd+Shift+G` | Find previous | Previous search result |
| `Cmd+Shift+H` | Show scrollback | View command history |

## Configuration Details

### Font Settings
```conf
# Font configuration
font_family      JetBrains Mono
bold_font        JetBrains Mono Bold
italic_font      JetBrains Mono Italic
bold_italic_font JetBrains Mono Bold Italic
font_size        14.0

# Font features
disable_ligatures never
font_features    JetBrainsMono-Regular +cv01 +cv02 +cv03 +cv05 +cv99 +ss04
```

### Performance Settings
```conf
# Performance optimizations
repaint_delay    10
input_delay      3
sync_to_monitor  yes
enable_audio_bell no

# Scrollback
scrollback_lines 10000
scrollback_pager less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER
```

### Window Settings
```conf
# Window appearance
window_padding_width 5
placement_strategy   center
hide_window_decorations titlebar-only

# Tab appearance
tab_bar_edge    bottom
tab_bar_style   powerline
tab_powerline_style slanted
```

## OneDark Theme

### Color Palette
- **Background**: `#282c34` (Dark gray)
- **Foreground**: `#abb2bf` (Light gray)
- **Black**: `#1e2127` / `#545862`
- **Red**: `#e06c75` / `#e06c75`
- **Green**: `#98c379` / `#98c379`
- **Yellow**: `#e5c07b` / `#e5c07b`
- **Blue**: `#61afef` / `#61afef`
- **Magenta**: `#c678dd` / `#c678dd`
- **Cyan**: `#56b6c2` / `#56b6c2`
- **White**: `#abb2bf` / `#c8ccd4`

### Usage Examples
- **Comments**: Dimmed with appropriate contrast
- **Strings**: Green for easy identification
- **Keywords**: Blue for language constructs
- **Functions**: Yellow for definitions
- **Variables**: Standard foreground color

## Advanced Features

### Session Management
```bash
# Save current session
kitty @ ls --all-env-vars > session.json

# Restore session
kitty --session session.json
```

### Remote Control
```bash
# Enable remote control
allow_remote_control yes

# Control kitty from command line
kitty @ set-colors --all foreground=red
kitty @ new-window --title "New Window"
```

### Custom Layouts
```conf
# Define custom layouts
enabled_layouts tall:bias=50;full_size=1;mirrored=false
```

### Window Rules
```conf
# Automatic window sizing for specific applications
map cmd+1 new_window_with_cwd
map cmd+2 new_window_with_cwd --title "Development"
```

## Integration

### With Shell
```bash
# Shell integration for enhanced features
shell_integration enabled

# Automatic title setting
# set window title to current directory
```

### With Tmux
- Compatible with tmux sessions
- Supports tmux escape sequences
- Proper color handling in tmux

### With Neovim
- True color support
- Proper cursor shape handling
- Fast redraw performance

## Customization

### Custom Key Bindings
Edit `custom.conf`:
```conf
# Custom shortcuts
map cmd+shift+enter new_window_with_cwd
map cmd+shift+t     new_tab_with_cwd
map cmd+shift+r     load_config_file
```

### Theme Switching
```conf
# Include different themes
include onedark.conf    # Dark theme
# include onelight.conf # Light theme (alternative)
```

### Font Adjustments
```conf
# Per-application font sizes
font_size 12.0

# Adjust for high-DPI displays
text_composition_strategy platform
```

## Troubleshooting

### Font Issues
1. **Missing ligatures**: Check font installation
2. **Blurry text**: Adjust `text_composition_strategy`
3. **Wrong font**: Verify font name with `kitty +list-fonts`

### Performance Issues
1. **Slow rendering**: Disable `sync_to_monitor`
2. **High CPU**: Reduce `repaint_delay`
3. **Memory usage**: Lower `scrollback_lines`

### Color Problems
1. **Wrong colors**: Check `TERM` environment variable
2. **Theme not loading**: Verify `include` statements
3. **Inconsistent colors**: Check terminal app settings

### Input Lag
1. **Keyboard delay**: Reduce `input_delay`
2. **Mouse lag**: Check mouse acceleration settings
3. **Network lag**: Use local sessions when possible

## Installation

### Automatic Installation
```bash
cd ~/.dotfiles
./install.sh
```

### Manual Installation
```bash
# Create config directory
mkdir -p ~/.config/kitty

# Symlink configuration files
ln -sf ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/
ln -sf ~/.dotfiles/kitty/onedark.conf ~/.config/kitty/
ln -sf ~/.dotfiles/kitty/custom.conf ~/.config/kitty/

# Install Kitty (if not already installed)
brew install --cask kitty
```

### Font Installation
```bash
# Install JetBrains Mono (recommended)
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

# Or install via direct download
# Download from: https://www.jetbrains.com/mono/
```

## Tips and Tricks

### Productivity
- Use tabs for different projects
- Create custom layouts for specific workflows
- Set up window rules for automatic organization
- Use session management for complex setups

### Development
- Configure font ligatures for better code readability
- Use split panes for editor + terminal workflow
- Set up project-specific shortcuts
- Integrate with development tools

### Customization
- Experiment with different themes
- Adjust font sizes per monitor
- Create workspace-specific configurations
- Use remote control for automation

## Comparison with Other Terminals

### vs iTerm2
- **Performance**: Kitty is generally faster
- **Features**: iTerm2 has more built-in features
- **Configuration**: Kitty uses text files, iTerm2 uses GUI
- **GPU acceleration**: Kitty has better GPU support

### vs Alacritty
- **Features**: Kitty has more features (tabs, windows)
- **Performance**: Similar performance
- **Configuration**: Both use text-based config
- **Platform support**: Both cross-platform

### vs Terminal.app
- **Performance**: Kitty is significantly faster
- **Features**: Much more feature-rich
- **Customization**: Far more customizable
- **Modern features**: Better Unicode and emoji support

## Future Enhancements

### Planned Features
- Better integration with development tools
- Enhanced session management
- More built-in layouts
- Improved remote control capabilities

### Community Themes
- Explore kitty-themes repository
- Create custom theme variations
- Share configurations with team
- Contribute improvements back to community