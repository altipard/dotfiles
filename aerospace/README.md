# Aerospace Window Manager Configuration

Modern tiling window manager for macOS with German keyboard optimization and mnemonic workspace organization.

## Overview

Aerospace provides:
- **Tiling window management**: Automatic window arrangement
- **Workspace organization**: Mnemonic-based workspace system
- **German keyboard optimization**: Collision-free shortcuts using Meh-key
- **App-specific routing**: Automatic app placement in designated workspaces
- **Vim-style navigation**: Intuitive hjkl movement
- **Flexible layouts**: Multiple layout options per workspace

## Files Structure

```
aerospace/
├── aerospace.toml    # Main configuration file
└── README.md         # This documentation
```

## Key Concept: Meh-Key via Space

### The Problem
German Mac keyboards reserve Alt combinations for special characters:
- `Alt+N` → `~`
- `Alt+L` → `@` 
- `Alt+E` → `€`
- `Alt+8/9` → `{}`

### The Solution
**Space key as Meh-Key modifier** (Shift+Ctrl+Alt):
- **Hold Space** → Meh-Key (Shift+Ctrl+Alt)
- **Tap Space** → Normal space character
- **Right Cmd + Space** → Hyper-Key (Shift+Ctrl+Alt+Cmd)

This is enabled through Karabiner-Elements configuration.

## Workspace Organization

### Mnemonic System
Workspaces are organized by first letter for easy memorization:

| Key | Workspace | Primary Apps | Purpose |
|-----|-----------|--------------|---------|
| `Space+B` | **B**rowser | Chrome, Safari, Firefox | Web browsing |
| `Space+C` | **C**ode | VSCode, IntelliJ, Xcode | Development |
| `Space+M` | **M**essages | WhatsApp, Mail, Slack, Teams | Communication |
| `Space+T` | **T**erminal | iTerm, Terminal, Ghostty, Kitty | Command line |
| `Space+V` | **V**ideo | Zoom, Teams, FaceTime | Video meetings |
| `Space+D` | **D**ocumentation | Obsidian, Notion, Craft | Note-taking |
| `Space+E` | **E**ntertainment | Spotify, YouTube Music | Media |
| `Space+F` | **F**inder | Finder, Path Finder | File management |
| `Space+G` | **G**it | GitHub Desktop, GitKraken | Git workflows |
| `Space+N` | **N**otes | Notes, Bear, Drafts | Quick notes |
| `Space+P` | **P**roductivity | Calendar, Reminders, Tasks | Planning |
| `Space+R` | **R**esearch | Dedicated browser windows | Research |
| `Space+S` | **S**ystem | System Preferences, Activity Monitor | System tools |
| `Space+U` | **U**tilities | 1Password, CleanMyMac | Utility apps |
| `Space+W` | **W**ork | Work-specific applications | Professional tools |

### Overflow Workspaces
| Key | Workspace | Purpose |
|-----|-----------|---------|
| `Space+1-9` | Numeric | Additional workspaces for temporary use |

## Key Bindings

### Window Focus (Vim-style)
| Key | Action | Description |
|-----|--------|-------------|
| `Space+H` | Focus left | Move focus to left window |
| `Space+J` | Focus down | Move focus to window below |
| `Space+K` | Focus up | Move focus to window above |
| `Space+L` | Focus right | Move focus to right window |

### Window Movement
| Key | Action | Description |
|-----|--------|-------------|
| `Space+Cmd+H` | Move left | Move window to left |
| `Space+Cmd+J` | Move down | Move window down |
| `Space+Cmd+K` | Move up | Move window up |
| `Space+Cmd+L` | Move right | Move window to right |

### Workspace Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `Space+[Letter]` | Switch workspace | Go to workspace by mnemonic |
| `Space+Cmd+[Letter]` | Move to workspace | Move window to workspace |
| `Space+Tab` | Last workspace | Switch to previous workspace |

### Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `Space+Space` | Toggle layout | Cycle through available layouts |
| `Space+Enter` | Fullscreen | Toggle window fullscreen |
| `Space+Q` | Close window | Close current window |
| `Space+Shift+Space` | Float/tile | Toggle floating mode |

### Resize Mode
| Key | Action | Description |
|-----|--------|-------------|
| `Space+;` | Enter resize | Activate resize mode |
| `H/J/K/L` | Resize (50px) | Resize in direction (large steps) |
| `Shift+H/J/K/L` | Resize (10px) | Resize in direction (fine steps) |
| `Esc` or `Enter` | Exit resize | Leave resize mode |

## Layout System

### Available Layouts
1. **Tiles**: Automatic tiling with main and stack areas
2. **Accordion**: Stack windows with focus expansion
3. **Columns**: Vertical columns with horizontal splits
4. **Float**: Traditional overlapping windows

### Layout Behavior
- **Main area**: Primary window gets larger space
- **Stack area**: Secondary windows share remaining space
- **Dynamic adjustment**: Layouts adapt to window count
- **Per-workspace**: Each workspace can have different layouts

## App Assignment Rules

### Automatic Routing
Applications automatically open in their designated workspaces:

```toml
# Browser applications → B workspace
[[on-window-detected]]
if.app-id = 'com.google.Chrome'
run = 'move-node-to-workspace B'

# Development tools → C workspace  
[[on-window-detected]]
if.app-id = 'com.microsoft.VSCode'
run = 'move-node-to-workspace C'

# Terminal applications → T workspace
[[on-window-detected]]
if.app-id = 'com.googlecode.iterm2'
run = 'move-node-to-workspace T'
```

### Benefits
- **Consistent organization**: Apps always open in expected locations
- **Reduced cognitive load**: No manual window management
- **Workflow optimization**: Related apps grouped together
- **Quick access**: Know exactly where to find each app

## Configuration Details

### Basic Settings
```toml
# Automatically start AeroSpace at login
start-at-login = true

# Normalizations fix compatibility issues
enable-normalization-flatten-containers = true
enable-normalization-opposite-orientation-for-nested-containers = true

# Animation settings
accordion-padding = 30

# Focus follows mouse
on-focus-changed = ['move-mouse window-lazy-center']
```

### Gap Configuration
```toml
# Window gaps
[gaps]
inner.horizontal = 10
inner.vertical = 10
outer.left = 10
outer.bottom = 10
outer.top = 10
outer.right = 10
```

### Mode Configuration
```toml
# Default mode bindings
[mode.main.binding]
# Window focus
alt-h = 'focus left'
alt-j = 'focus down'  
alt-k = 'focus up'
alt-l = 'focus right'

# Window movement
alt-shift-h = 'move left'
alt-shift-j = 'move down'
alt-shift-k = 'move up'
alt-shift-l = 'move right'
```

## German Keyboard Considerations

### Avoided Key Combinations
These combinations are **NOT used** due to German keyboard conflicts:
- `Alt+N` (produces ~)
- `Alt+L` (produces @)
- `Alt+E` (produces €)
- `Alt+8/9` (produces {})
- `Alt+Q/W/R/T/Z/U/I/O/P` (various special characters)

### Safe Key Combinations
Using Meh-key (Space) avoids all conflicts:
- **Letters**: All letters available with Space modifier
- **Numbers**: 1-9 safe for workspace switching
- **Symbols**: `;` safe for resize mode
- **Special keys**: Enter, Tab, Esc work perfectly

## Integration with Other Tools

### Karabiner-Elements
- **Enables Space as Meh-key**: Core functionality requirement
- **Profile**: "Aerospace Meh Key" must be active
- **Tap vs Hold**: Distinguishes between space character and modifier

### SketchyBar
- **Workspace display**: Shows all workspaces in status bar
- **Click navigation**: Click workspace buttons to switch
- **App indicators**: Shows running apps per workspace
- **Live updates**: Real-time workspace status

### Terminal Integration
- **Terminal workspace**: Dedicated T workspace for all terminals
- **Tmux compatibility**: Works well with tmux sessions
- **Multiple terminals**: iTerm2, Kitty, Ghostty all supported

## Troubleshooting

### Common Issues

#### Space Key Not Working
1. **Check Karabiner**: Ensure "Aerospace Meh Key" profile is active
2. **Restart Karabiner**: Sometimes requires restart after config changes
3. **Verify permissions**: Karabiner needs accessibility permissions
4. **Test without AeroSpace**: Verify Karabiner is working independently

#### Apps Not Auto-Routing
1. **Check app IDs**: Use `osascript -e 'id of app "AppName"'` to verify
2. **Update config**: Add missing app rules to aerospace.toml
3. **Restart AeroSpace**: Reload configuration after changes
4. **Manual assignment**: Use `Space+Cmd+Letter` to move windows manually

#### Focus Issues
1. **Mouse settings**: Check "Focus follows mouse" in config
2. **App compatibility**: Some apps don't handle focus well
3. **System settings**: Verify macOS accessibility permissions
4. **Conflicting tools**: Disable other window managers

#### Performance Problems
1. **Animation settings**: Reduce or disable animations
2. **Gap sizes**: Smaller gaps = better performance
3. **App count**: Too many apps can slow workspace switching
4. **Memory usage**: Monitor AeroSpace memory consumption

### Diagnostic Commands
```bash
# Check AeroSpace status
aerospace list-workspaces

# List all windows
aerospace list-windows --all

# Show current workspace
aerospace list-workspaces --focused

# Reload configuration
aerospace reload-config
```

## Advanced Configuration

### Custom Layouts
```toml
# Define custom layout behavior
[mode.main.binding]
alt-s = 'layout v_accordion'  # Vertical accordion
alt-w = 'layout h_accordion'  # Horizontal accordion
alt-e = 'layout tiles horizontal vertical'  # Custom tiling
alt-r = 'layout floating'     # Floating layout
```

### Conditional Rules
```toml
# Advanced app routing with conditions
[[on-window-detected]]
if.app-id = 'com.apple.Safari'
if.window-title-regex-substring = 'GitHub'
run = 'move-node-to-workspace G'

# Different behavior for specific windows
[[on-window-detected]]
if.app-id = 'com.google.Chrome'
if.window-title-regex-substring = 'YouTube'
run = 'move-node-to-workspace E'
```

### Workspace-Specific Settings
```toml
# Different layouts per workspace
[workspace-to-monitor-force-assignment]
B = 'main'    # Browser always on main monitor
C = 'main'    # Code always on main monitor
M = 'secondary'  # Messages on secondary monitor
```

## Installation

### Automatic Installation
```bash
cd ~/.dotfiles
./install.sh
```

### Manual Installation
```bash
# Install AeroSpace
brew install --cask nikitabobko/tap/aerospace

# Create config directory
mkdir -p ~/.config/aerospace

# Symlink configuration
ln -sf ~/.dotfiles/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml

# Start AeroSpace
open -a AeroSpace
```

### Dependencies
1. **Karabiner-Elements**: Required for Space key functionality
2. **Accessibility permissions**: Required for window management
3. **SketchyBar**: Optional but recommended for workspace display

## Tips and Best Practices

### Workflow Optimization
1. **Consistent app placement**: Always open apps in designated workspaces
2. **Workspace switching**: Use mnemonic letters for quick navigation
3. **Window arrangement**: Let AeroSpace handle layout automatically
4. **Focus management**: Use hjkl for quick window navigation

### Customization
1. **Add new workspaces**: Choose meaningful mnemonic letters
2. **App rules**: Add auto-routing for your frequently used apps
3. **Layout preferences**: Experiment with different layouts per workspace
4. **Gap sizes**: Adjust gaps based on screen size and preference

### Keyboard Efficiency
1. **Learn mnemonics**: Memorize workspace letter assignments
2. **Use resize mode**: Efficient for precise window sizing
3. **Combine with other tools**: Leverage tmux for terminal multiplexing
4. **Practice navigation**: Develop muscle memory for hjkl movement

### Multi-Monitor Setup
1. **Workspace assignment**: Assign workspaces to specific monitors
2. **App routing**: Route apps to appropriate monitors automatically
3. **Focus behavior**: Configure focus behavior across monitors
4. **Layout adaptation**: Different layouts work better on different screen sizes

## Migration from Other Window Managers

### From Rectangle/Magnet
- **Similar shortcuts**: Many concepts translate directly
- **Enhanced features**: More powerful workspace management
- **Configuration**: Text-based vs GUI configuration
- **Learning curve**: Initial setup more complex but more powerful

### From Amethyst/yabai
- **Comparable features**: Similar tiling capabilities
- **Better integration**: Native macOS integration
- **Simpler setup**: Easier configuration and installation
- **Performance**: Generally better performance and stability

### From Manual Window Management
- **Automation**: Eliminates manual window arrangement
- **Consistency**: Predictable window placement
- **Efficiency**: Faster workspace switching
- **Organization**: Better project separation

## Future Enhancements

### Planned Features
- **Window rules**: More sophisticated window matching
- **Layouts**: Additional layout options
- **Integration**: Better integration with other tools
- **Performance**: Continued performance improvements

### Community Contributions
- **Config sharing**: Share workspace configurations
- **App rules**: Contribute app routing rules
- **Bug reports**: Help improve stability
- **Feature requests**: Suggest new functionality