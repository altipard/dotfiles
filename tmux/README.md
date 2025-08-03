# Tmux Configuration

Terminal multiplexer configuration optimized for German keyboards with Nordic theme.

## Overview

This tmux setup provides:
- German keyboard layout optimization
- Nordic-inspired color theme
- Vim-style navigation
- Enhanced pane and window management
- Clipboard integration
- Mouse support

## Files Structure

```
tmux/
├── tmux.conf              # Main tmux configuration
├── nordic-theme.conf      # Nordic color theme
└── TMUX-CHEATSHEET.md     # Quick reference guide
```

## Key Features

### German Keyboard Optimized
- **Collision-free shortcuts**: Avoids Alt+character conflicts
- **Special character support**: Works with German umlauts
- **Window creation**: `Prefix + ß` for new windows
- **Easy access**: Alt+numbers for window switching

### Nordic Theme
- **Consistent colors**: Based on Nord color palette
- **Clean status bar**: Minimal, informative design
- **Visual clarity**: High contrast for readability
- **Session indicators**: Clear session and window identification

### Vim Integration
- **Navigation**: Vim-style hjkl movement
- **Copy mode**: Vi key bindings
- **Pane splitting**: Intuitive | and - splits
- **Focus events**: Better Neovim integration

## Key Bindings

### Prefix Key
- **Prefix**: `Ctrl+a` (instead of default Ctrl+b)
- **Send prefix**: `Ctrl+a Ctrl+a` (for nested sessions)

### Session Management
| Key | Action | Description |
|-----|--------|-------------|
| `Prefix + r` | Reload config | Reload tmux.conf |
| `Prefix + d` | Detach | Detach from session |
| `Prefix + s` | Session list | Choose session interactively |

### Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `Prefix + ß` | New window | Create new window |
| `Alt + h` | Previous window | Switch to previous window |
| `Alt + l` | Next window | Switch to next window |
| `Alt + 1-9` | Window by number | Jump to specific window |
| `Prefix + &` | Kill window | Close current window |
| `Prefix + ,` | Rename window | Rename current window |

### Pane Management
| Key | Action | Description |
|-----|--------|-------------|
| `Prefix + \|` | Vertical split | Split pane vertically |
| `Prefix + -` | Horizontal split | Split pane horizontally |
| `Prefix + h/j/k/l` | Navigate panes | Vim-style pane navigation |
| `Prefix + H/J/K/L` | Resize panes | Resize panes in direction |
| `Prefix + z` | Zoom pane | Toggle pane fullscreen |
| `Prefix + x` | Kill pane | Close current pane |

### Copy Mode
| Key | Action | Description |
|-----|--------|-------------|
| `Prefix + [` | Enter copy mode | Start copy mode |
| `v` | Begin selection | Start visual selection |
| `y` | Copy selection | Copy to clipboard |
| `Prefix + ]` | Paste | Paste from clipboard |

### Mouse Support
- **Pane selection**: Click to select panes
- **Window switching**: Click on window names
- **Scrolling**: Mouse wheel to scroll history
- **Resizing**: Drag pane borders

## Configuration Details

### Performance Settings
```bash
set -g history-limit 10000      # Large scrollback buffer
set -sg escape-time 0           # No delay for escape key
set -g focus-events on          # Better Vim integration
```

### Display Settings
```bash
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",xterm-256color*:Tc"
set -g base-index 1             # Start numbering at 1
setw -g pane-base-index 1       # Start pane numbering at 1
set -g renumber-windows on      # Renumber on window close
```

### Status Bar
```bash
set -g status-left-length 200   # Long status sections
set -g status-right-length 200
set -g status-interval 1        # Update every second
```

## Nordic Theme Details

### Color Palette
- **Background**: `#3B4252` (Nord Polar Night)
- **Foreground**: `#D8DEE9` (Nord Snow Storm)
- **Session**: `#A3BE8C` (Nord Aurora Green)
- **Active Window**: `#88C0D0` (Nord Frost Cyan)
- **Selection**: `#81A1C1` (Nord Frost Blue)

### Status Bar Elements
- **Left**: Session name with green accent
- **Right**: Date and time in clean format
- **Windows**: Clear active/inactive distinction
- **Panes**: Subtle borders with visibility

## German Keyboard Considerations

### Alt Key Conflicts
German keyboards use Alt for special characters:
- `Alt+n` → `~`
- `Alt+l` → `@`
- `Alt+e` → `€`
- `Alt+8/9` → `{}`

### Solutions Implemented
- **Window navigation**: Uses `Alt+h/l` (safe keys)
- **Window selection**: `Alt+1-9` (number keys work)
- **Special characters**: `ß` for new windows
- **No conflicts**: Careful key selection

## Installation

### Automatic Installation
```bash
cd ~/.dotfiles
./install.sh
```

### Manual Installation
```bash
# Backup existing config
mv ~/.tmux.conf ~/.tmux.conf.backup

# Symlink configuration
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# Start new tmux session
tmux new-session
```

### Plugin Manager (Optional)
For advanced plugin support:
```bash
# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Add to tmux.conf
set -g @plugin 'tmux-plugins/tpm'

# Install plugins: Prefix + I
```

## Customization

### Adding Custom Key Bindings
Edit `tmux.conf`:
```bash
# Example: Custom split with current path
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
```

### Theme Customization
Modify `nordic-theme.conf`:
```bash
# Change accent color
session_fg="#BF616A"  # Nord Aurora Red instead of green
```

### Window Naming
```bash
# Automatic rename based on current command
setw -g automatic-rename on
setw -g automatic-rename-format '#{b:pane_current_path}'
```

## Troubleshooting

### Colors Not Working
1. Check terminal color support: `echo $TERM`
2. Verify 256-color support: `tput colors`
3. Test true color: `tmux info | grep Tc`

### Key Bindings Not Working
1. Check prefix key: `tmux show-options -g prefix`
2. List all bindings: `tmux list-keys`
3. Test in clean session: `tmux -f /dev/null`

### German Characters Issues
1. Check locale: `locale`
2. Verify UTF-8 support: `tmux show-options -g status-utf8`
3. Test character input in tmux

### Performance Issues
1. Reduce status interval: `set -g status-interval 5`
2. Limit history: `set -g history-limit 5000`
3. Disable unused features

## Integration

### With Neovim
- Seamless navigation between tmux panes and Vim splits
- Shared clipboard functionality
- Focus events for better file watching

### With Zsh
- Auto-start tmux session on shell startup
- Shared history between panes
- Proper terminal title handling

### With Terminal Emulators
- **iTerm2**: Native tmux integration mode
- **Kitty**: GPU acceleration support
- **Ghostty**: Modern terminal features

## Advanced Usage

### Session Management
```bash
# Create named session
tmux new-session -d -s development

# Attach to session
tmux attach-session -t development

# List sessions
tmux list-sessions
```

### Scripted Setup
```bash
#!/bin/bash
# Development environment script
tmux new-session -d -s dev -n editor
tmux send-keys -t dev:editor 'cd ~/projects && nvim' Enter
tmux new-window -t dev -n terminal
tmux send-keys -t dev:terminal 'cd ~/projects' Enter
tmux attach-session -t dev
```

### Copy Mode Tips
- **Search**: `/` for forward search, `?` for backward
- **Jump**: `f{char}` to jump to character
- **Word selection**: `w` for next word, `b` for previous
- **Line selection**: `0` for line start, `$` for line end

## Common Workflows

### Development Setup
1. Start tmux session: `tmux new -s project`
2. Split for editor: `Prefix + |`
3. Split for terminal: `Prefix + -`
4. Create monitoring window: `Prefix + ß`

### Remote Development
1. SSH to remote server
2. Start/attach tmux session
3. Detach before disconnecting: `Prefix + d`
4. Reattach on reconnection: `tmux attach`

### Multi-project Management
1. One session per project
2. Use descriptive session names
3. Switch between sessions: `Prefix + s`
4. Kill finished sessions: `tmux kill-session -t name`