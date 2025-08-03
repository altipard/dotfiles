# SketchyBar Configuration

Highly customizable macOS status bar replacement with Aerospace workspace integration and comprehensive system monitoring.

## Overview

SketchyBar provides:
- **Status bar replacement**: Modern alternative to macOS menu bar
- **Aerospace integration**: Live workspace display and switching
- **System monitoring**: CPU, battery, volume, media controls
- **App indicators**: Running apps with icons per workspace
- **Lua configuration**: Powerful scripting capabilities
- **GPU acceleration**: Smooth animations and performance
- **Clickable elements**: Interactive status bar components

## Files Structure

```
sketchybar/
├── sketchybarrc          # Main configuration file
├── colors.sh             # Color scheme definitions
├── items/                # Item configuration scripts
│   ├── spaces.sh         # Aerospace workspace display
│   ├── front_app.sh      # Current application indicator
│   ├── battery.sh        # Battery status
│   ├── calendar.sh       # Date and time
│   ├── cpu.sh           # CPU usage monitor
│   ├── media.sh         # Media controls
│   └── volume.sh        # Volume control
├── plugins/              # Plugin scripts for dynamic content
│   ├── space.sh          # Workspace management
│   ├── space_windows.sh  # Window detection per workspace
│   ├── front_app.sh      # App switching logic
│   ├── battery.sh        # Battery monitoring
│   ├── cpu.sh           # CPU usage calculation
│   ├── media.sh         # Media player integration
│   ├── volume.sh        # Volume level detection
│   └── icon_map_fn.sh   # App icon mapping
└── README.md            # This documentation
```

## Key Features

### Aerospace Workspace Integration
- **Live workspace display**: Shows all Aerospace workspaces in status bar
- **Clickable switching**: Click workspace buttons to switch
- **App indicators**: Displays running apps per workspace with icons
- **Real-time updates**: Automatically detects workspace changes
- **Mnemonic labels**: Shows workspace letters (B, C, T, etc.)

### System Monitoring
- **CPU usage**: Real-time CPU utilization graph
- **Battery status**: Battery percentage and charging state
- **Volume control**: Current volume level with mute indicator
- **Date/time**: Customizable date and time display
- **Media controls**: Current playing track and controls

### App Integration
- **Current app**: Shows currently focused application
- **App icons**: Displays app icons using SketchyBar-App-Font
- **Window detection**: Tracks windows per workspace
- **Focus events**: Updates on app switching

## Bar Layout

```
[Workspaces] [Current App]                    [Media] [CPU] [Battery] [Volume] [Date/Time]
 B  C  T  M     Terminal.app    ♪ Spotify     ▁▃▅ 45%  🔋 85%   🔊 70%   Dec 25 14:30
```

### Left Side Elements
1. **Workspaces**: Aerospace workspace buttons (B, C, T, M, etc.)
2. **Current App**: Name and icon of focused application

### Right Side Elements
1. **Media**: Currently playing track and controls
2. **CPU**: Usage graph and percentage
3. **Battery**: Charge level and status
4. **Volume**: Audio level indicator
5. **Calendar**: Date and time display

## Configuration Details

### Bar Appearance
```bash
sketchybar --bar height=37        \
                 blur_radius=30   \
                 position=top     \
                 sticky=off       \
                 padding_left=10  \
                 padding_right=10 \
                 color=$BAR_COLOR
```

Features:
- **Height**: 37px for comfortable visibility
- **Blur**: 30px blur radius for translucency
- **Position**: Top of screen
- **Padding**: 10px margins on sides
- **Color**: Defined in colors.sh

### Default Item Settings
```bash
sketchybar --default icon.font="SF Pro:Semibold:15.0"  \
                     icon.color=$WHITE                 \
                     label.font="SF Pro:Semibold:15.0" \
                     label.color=$WHITE                \
                     background.color=$ITEM_BG_COLOR   \
                     background.corner_radius=5        \
                     background.height=24              \
                     padding_left=5                    \
                     padding_right=5
```

## Workspace Integration

### Aerospace Spaces Display
The `spaces.sh` item creates buttons for each Aerospace workspace:

```bash
# Dynamic workspace creation
for space in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$space left \
             --set space.$space associated_space=$space \
                                icon=$space \
                                click_script="aerospace workspace $space"
done
```

### Features
- **Dynamic creation**: Automatically detects available workspaces
- **Click navigation**: Click to switch workspaces
- **Visual indicators**: Shows active workspace
- **App icons**: Displays running apps per workspace
- **Real-time updates**: Updates when apps move between workspaces

### Window Detection
The `space_windows.sh` plugin tracks applications per workspace:

```bash
# Get apps in current workspace
apps=$(aerospace list-windows --workspace $space --format '%{app-name}')

# Update workspace button with app indicators
sketchybar --set space.$space label="$app_icons"
```

## Color Scheme

### Defined in colors.sh
```bash
# Color definitions (example Nord theme)
export BLACK=0xff2e3440
export WHITE=0xffd8dee9
export RED=0xffbf616a
export GREEN=0xffa3be8c
export BLUE=0xff81a1c1
export YELLOW=0xffebcb8b
export ORANGE=0xffd08770
export MAGENTA=0xffb48ead
export GREY=0xff434c5e
export TRANSPARENT=0x00000000

# Bar specific colors
export BAR_COLOR=$BLACK
export ITEM_BG_COLOR=$GREY
export ACCENT_COLOR=$BLUE
export ALERT_COLOR=$RED
```

### Usage Throughout Configuration
- **Bar background**: Uses BAR_COLOR
- **Item backgrounds**: Uses ITEM_BG_COLOR
- **Active states**: Uses ACCENT_COLOR
- **Alerts/warnings**: Uses ALERT_COLOR
- **Text**: Uses WHITE for primary text

## System Monitoring Modules

### CPU Usage
```bash
# plugins/cpu.sh
CPU_USAGE=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')
sketchybar --set cpu label="${CPU_USAGE}%"
```

### Battery Status
```bash
# plugins/battery.sh
BATTERY=$(pmset -g batt | grep -o '[0-9]*%' | head -1)
CHARGING=$(pmset -g batt | grep -q "AC Power" && echo "⚡" || echo "🔋")
sketchybar --set battery label="${CHARGING} ${BATTERY}"
```

### Volume Control
```bash
# plugins/volume.sh
VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")
ICON=$( [[ $MUTED == "true" ]] && echo "🔇" || echo "🔊" )
sketchybar --set volume label="${ICON} ${VOLUME}%"
```

### Media Integration
```bash
# plugins/media.sh
TRACK=$(osascript -e 'tell application "Spotify" to artist of current track & " - " & name of current track')
sketchybar --set media label="♪ $TRACK"
```

## App Icon Integration

### SketchyBar-App-Font
The configuration uses SketchyBar-App-Font for application icons:

```bash
# App icon mapping function
get_app_icon() {
  case $1 in
    "Google Chrome") echo "" ;;
    "Safari") echo "" ;;
    "Terminal") echo "" ;;
    "Visual Studio Code") echo "" ;;
    "Spotify") echo "" ;;
    *) echo "" ;;
  esac
}
```

### Installation
```bash
# Install SketchyBar-App-Font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o /tmp/sketchybar-app-font.ttf
sudo mv /tmp/sketchybar-app-font.ttf /Library/Fonts/
```

## Interactive Elements

### Clickable Workspaces
```bash
# Click to switch workspace
sketchybar --set space.$space click_script="aerospace workspace $space"
```

### Volume Control
```bash
# Click to mute/unmute
sketchybar --set volume click_script="osascript -e 'set volume output muted not (output muted of (get volume settings))'"
```

### Media Controls
```bash
# Click to play/pause
sketchybar --set media click_script="osascript -e 'tell application \"Spotify\" to playpause'"
```

### Battery Details
```bash
# Click to show detailed battery info
sketchybar --set battery click_script="open -b com.apple.ActivityMonitor"
```

## Customization

### Adding New Items
1. **Create item script**: Add to `items/` directory
2. **Create plugin**: Add dynamic behavior in `plugins/`
3. **Source in main config**: Add to `sketchybarrc`
4. **Define colors**: Add any new colors to `colors.sh`

### Example: Weather Widget
```bash
# items/weather.sh
sketchybar --add item weather right \
           --set weather update_freq=1800 \
                        script="$PLUGIN_DIR/weather.sh"

# plugins/weather.sh
#!/bin/bash
WEATHER=$(curl -s "wttr.in?format=1")
sketchybar --set weather label="$WEATHER"
```

### Modifying Existing Items
1. **Edit item configuration**: Modify files in `items/`
2. **Update plugin logic**: Change behavior in `plugins/`
3. **Adjust colors**: Modify `colors.sh` for visual changes
4. **Test changes**: Restart SketchyBar to see updates

## Aerospace Integration Details

### Workspace Detection
```bash
# Get all workspaces
WORKSPACES=$(aerospace list-workspaces --all)

# Monitor workspace changes
aerospace listen workspace-changed | while read workspace; do
  # Update workspace indicators
  update_workspace_display
done
```

### App Movement Tracking
```bash
# Monitor app movements between workspaces
aerospace listen window-moved | while read event; do
  # Update app icons for affected workspaces
  update_app_icons
done
```

### Focus Events
```bash
# Monitor focus changes
aerospace listen window-focused | while read window; do
  # Update current app display
  update_current_app
done
```

## Performance Optimization

### Update Frequencies
```bash
# Different update rates for different components
CPU_UPDATE=5        # 5 seconds
BATTERY_UPDATE=30   # 30 seconds
MEDIA_UPDATE=1      # 1 second
WORKSPACE_UPDATE=0  # Event-driven
```

### Efficient Monitoring
- **Event-driven updates**: Use Aerospace listeners
- **Cached values**: Store frequently accessed data
- **Lazy loading**: Only update visible elements
- **Background processes**: Use async updates where possible

## Troubleshooting

### SketchyBar Not Starting
1. **Check installation**: `brew list sketchybar`
2. **Verify permissions**: Accessibility permissions may be needed
3. **Check config syntax**: Look for syntax errors in scripts
4. **Manual start**: `sketchybar --reload` to test

### Workspace Buttons Not Showing
1. **Aerospace running**: Ensure Aerospace is active
2. **Workspace detection**: Test `aerospace list-workspaces --all`
3. **Script permissions**: Ensure scripts are executable
4. **Path issues**: Verify script paths in configuration

### App Icons Missing
1. **Font installation**: Verify SketchyBar-App-Font is installed
2. **Icon mapping**: Check icon_map_fn.sh for app definitions
3. **App detection**: Verify app names match exactly
4. **Fallback icons**: Ensure default icons are defined

### Performance Issues
1. **Update frequency**: Reduce update rates for expensive operations
2. **Script optimization**: Profile slow scripts
3. **Memory usage**: Monitor SketchyBar memory consumption
4. **Background processes**: Check for runaway background jobs

## Installation

### Automatic Installation
```bash
cd ~/.dotfiles
./install.sh
```

### Manual Installation
```bash
# Install SketchyBar
brew tap FelixKratz/formulae
brew install sketchybar

# Install SketchyBar-App-Font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o /tmp/sketchybar-app-font.ttf
sudo mv /tmp/sketchybar-app-font.ttf /Library/Fonts/

# Create config directory
mkdir -p ~/.config/sketchybar

# Copy configuration files
cp -r ~/.dotfiles/sketchybar/* ~/.config/sketchybar/

# Make scripts executable
chmod +x ~/.config/sketchybar/sketchybarrc
chmod +x ~/.config/sketchybar/items/*.sh
chmod +x ~/.config/sketchybar/plugins/*.sh

# Start SketchyBar
sketchybar --reload
```

### Auto-start Setup
```bash
# Add to login items via System Preferences or:
brew services start sketchybar
```

## Advanced Features

### Custom Layouts
```bash
# Create workspace-specific layouts
case $workspace in
  "C") # Code workspace - show development tools
    show_git_status=true
    show_test_status=true
    ;;
  "M") # Messages workspace - show notification count
    show_message_count=true
    ;;
esac
```

### Conditional Display
```bash
# Show different elements based on context
if [[ $(aerospace list-windows --workspace focused) ]]; then
  # Workspace has windows - show detailed info
  show_detailed_info
else
  # Empty workspace - minimal display
  show_minimal_info
fi
```

### Integration with Other Tools
```bash
# Git status integration
GIT_STATUS=$(git status --porcelain 2>/dev/null | wc -l)
sketchybar --set git_status label="±$GIT_STATUS"

# Docker status
DOCKER_CONTAINERS=$(docker ps -q | wc -l)
sketchybar --set docker label="🐳 $DOCKER_CONTAINERS"
```

## Hiding macOS Menu Bar

To use SketchyBar as a complete replacement:

### Via System Settings
1. **System Settings** → **Desktop & Dock**
2. **Automatically hide and show the menu bar** → **Always**

### Via Terminal
```bash
# Hide menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true
killall Finder

# Show menu bar (to undo)
defaults write NSGlobalDomain _HIHideMenuBar -bool false
killall Finder
```

## Tips and Best Practices

### Configuration Management
1. **Modular design**: Keep components in separate files
2. **Color consistency**: Use centralized color definitions
3. **Error handling**: Add error checking to scripts
4. **Documentation**: Comment complex configurations

### Performance
1. **Monitor resource usage**: Keep an eye on CPU/memory usage
2. **Optimize update rates**: Balance freshness with performance
3. **Cache expensive operations**: Store results of slow commands
4. **Profile scripts**: Identify and optimize slow components

### Customization
1. **Start simple**: Begin with basic configuration
2. **Test incrementally**: Add features one at a time
3. **Backup configurations**: Keep working configurations safe
4. **Share improvements**: Contribute useful modifications back

### Integration
1. **Consistent shortcuts**: Align with other tool shortcuts
2. **Visual consistency**: Match color schemes across tools
3. **Functional harmony**: Ensure tools work well together
4. **Workflow optimization**: Design for your specific workflow