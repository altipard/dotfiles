# Karabiner-Elements Configuration

Keyboard customization that enables Space key as Meh-Key modifier for Aerospace window management.

## Overview

**STATUS: Currently not activated - manual activation required**

Karabiner-Elements provides:
- **Space key transformation**: Hold Space → Meh-Key (Shift+Ctrl+Alt)
- **Tap vs Hold detection**: Tap Space → normal space character
- **German keyboard optimization**: Avoids Alt conflicts with special characters
- **Aerospace integration**: Enables collision-free window management shortcuts
- **Profile management**: Dedicated "Aerospace Meh Key" profile

## Files Structure

```
karabiner/
├── karabiner.json    # Main configuration file with profiles and rules
└── README.md         # This documentation
```

## Key Functionality

### The Space Key Transformation
| Action | Result | Purpose |
|--------|--------|---------|
| **Tap Space** | Space character | Normal typing |
| **Hold Space** | Meh-Key (Shift+Ctrl+Alt) | Window management modifier |
| **Right Cmd + Space** | Hyper-Key (Shift+Ctrl+Alt+Cmd) | Extended shortcuts |

### German Keyboard Problem Solved
German Mac keyboards use Alt combinations for special characters:
- `Alt+N` → `~`
- `Alt+L` → `@`
- `Alt+E` → `€`
- `Alt+8/9` → `{}`

By using Space as modifier, all these conflicts are avoided.

## Configuration Details

### Profile Structure
The configuration includes a dedicated profile:
- **Profile Name**: "Aerospace Meh Key"
- **Purpose**: Enables Space key transformation
- **Activation**: Must be manually selected in Karabiner-Elements

### Core Rule
```json
{
  "description": "Space as Meh-Key for Aerospace",
  "manipulators": [
    {
      "from": {
        "key_code": "spacebar",
        "modifiers": {"optional": ["any"]}
      },
      "to": [
        {
          "key_code": "left_shift",
          "modifiers": ["left_control", "left_option"]
        }
      ],
      "to_if_alone": [
        {
          "key_code": "spacebar"
        }
      ],
      "type": "basic"
    }
  ]
}
```

### How It Works
1. **Key Detection**: Monitors spacebar press/release
2. **Hold Logic**: If held with other keys → Meh-Key
3. **Tap Logic**: If pressed alone → normal space
4. **Modifier Combination**: Shift+Ctrl+Alt for maximum compatibility
5. **Optional Modifiers**: Works with other modifiers if needed

## Installation Status

### Current Status: NOT ACTIVATED
- **Configuration**: Present in dotfiles
- **Installation**: Karabiner-Elements may not be installed
- **Activation**: Profile not currently active
- **Manual Steps Required**: See activation instructions below

### Activation Instructions

#### 1. Install Karabiner-Elements
```bash
# Via Homebrew (if not already installed)
brew install --cask karabiner-elements

# Or download from: https://karabiner-elements.pqrs.org/
```

#### 2. Grant Permissions
1. **System Preferences** → **Security & Privacy** → **Privacy**
2. **Input Monitoring**: Add and enable Karabiner-Elements
3. **Accessibility**: Add and enable Karabiner-Elements
4. **Restart** if prompted

#### 3. Load Configuration
```bash
# Symlink configuration (if not done by install script)
ln -sf ~/.dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

# Or manually import in Karabiner-Elements GUI
```

#### 4. Activate Profile
1. **Open Karabiner-Elements**
2. **Go to Profiles tab**
3. **Select "Aerospace Meh Key" profile**
4. **Verify profile is active** (checkmark should appear)

#### 5. Test Functionality
```bash
# Test Space key transformation:
# 1. Tap Space → should produce space character
# 2. Hold Space + H → should trigger Aerospace focus left
# 3. Hold Space + B → should switch to Browser workspace
```

## Usage with Aerospace

### Window Management
Once activated, these Space combinations work with Aerospace:

| Combination | Action | Description |
|-------------|--------|-------------|
| `Space+H/J/K/L` | Focus window | Vim-style navigation |
| `Space+Cmd+H/J/K/L` | Move window | Window repositioning |
| `Space+[Letter]` | Switch workspace | Mnemonic workspace switching |
| `Space+Cmd+[Letter]` | Move to workspace | Window to workspace |
| `Space+Enter` | Fullscreen | Toggle fullscreen |
| `Space+Q` | Close window | Close current window |

### Resize Mode
| Combination | Action | Description |
|-------------|--------|-------------|
| `Space+;` | Enter resize | Activate resize mode |
| Then `H/J/K/L` | Resize (50px) | Large resize steps |
| Then `Shift+H/J/K/L` | Resize (10px) | Fine resize steps |
| Then `Esc/Enter` | Exit resize | Leave resize mode |

## Troubleshooting

### Space Key Not Working as Modifier

#### Check Installation
```bash
# Verify Karabiner-Elements is installed
ls /Applications/ | grep -i karabiner

# Check if service is running
launchctl list | grep karabiner
```

#### Check Permissions
1. **System Preferences** → **Security & Privacy** → **Privacy**
2. **Input Monitoring**: Karabiner-Elements should be listed and enabled
3. **Accessibility**: Karabiner-Elements should be listed and enabled
4. **Full Disk Access**: May be required on some macOS versions

#### Check Profile Activation
1. **Open Karabiner-Elements**
2. **Profiles tab**: "Aerospace Meh Key" should be selected
3. **Simple Modifications tab**: Should show Space key modification
4. **Complex Modifications tab**: Should show the Space rule

#### Check Configuration
```bash
# Verify config file exists
ls ~/.config/karabiner/karabiner.json

# Check if profile exists in config
grep -A 5 "Aerospace Meh Key" ~/.config/karabiner/karabiner.json
```

### Space Character Not Working

#### Tap Detection Issues
1. **Timing sensitivity**: Adjust tap detection in Karabiner settings
2. **Key repeat**: Disable key repeat for spacebar if needed
3. **Modifier conflicts**: Ensure no other tools modify spacebar

#### Alternative Solutions
```json
// If tap detection is problematic, use different modifier
{
  "from": {"key_code": "right_command"},
  "to": [{"key_code": "left_shift", "modifiers": ["left_control", "left_option"]}]
}
```

### Conflicts with Other Apps

#### Common Conflicts
1. **Text Editors**: May interpret Meh-Key combinations
2. **Other Window Managers**: Disable conflicting tools
3. **Accessibility Tools**: May interfere with key detection
4. **Gaming Software**: Often conflicts with keyboard modifications

#### Resolution
1. **App-specific rules**: Add exceptions for problematic apps
2. **Temporary disable**: Create profiles for different use cases
3. **Alternative modifiers**: Use different key combinations if needed

## Advanced Configuration

### Multiple Profiles
```json
{
  "profiles": [
    {
      "name": "Default",
      "simple_modifications": []
    },
    {
      "name": "Aerospace Meh Key",
      "complex_modifications": {
        "rules": [/* Space transformation rule */]
      }
    },
    {
      "name": "Gaming",
      "simple_modifications": [/* Gaming-specific modifications */]
    }
  ]
}
```

### App-Specific Rules
```json
{
  "conditions": [
    {
      "bundle_identifiers": ["com.example.problematic-app"],
      "type": "frontmost_application_unless"
    }
  ],
  "description": "Space as Meh-Key (except in problematic app)"
}
```

### Additional Modifiers
```json
{
  "description": "Right Command as Hyper-Key",
  "manipulators": [
    {
      "from": {"key_code": "right_command"},
      "to": [{"key_code": "left_shift", "modifiers": ["left_control", "left_option", "left_command"]}],
      "type": "basic"
    }
  ]
}
```

## Alternative Configurations

### If Space Key Doesn't Work
1. **Caps Lock as modifier**: Traditional alternative
2. **Right Command**: Less frequently used
3. **Function keys**: F13-F19 for custom modifiers
4. **Key combinations**: Two-key combinations instead of modifier

### For Different Keyboards
1. **External keyboards**: May need different key codes
2. **International layouts**: Adjust for layout-specific keys
3. **Mechanical keyboards**: May have different timing characteristics
4. **Wireless keyboards**: May have input lag considerations

## Integration Testing

### Manual Tests
1. **Basic typing**: Ensure normal space works
2. **Window focus**: Test Space+H/J/K/L
3. **Workspace switching**: Test Space+B/C/T/etc.
4. **Resize mode**: Test Space+; then H/J/K/L
5. **Other apps**: Verify no conflicts in daily apps

### Automated Testing
```bash
# Script to test key combinations
#!/bin/bash
echo "Testing Karabiner-Elements configuration..."
echo "1. Type some text with spaces"
echo "2. Try Space+H (should focus left window)"
echo "3. Try Space+B (should switch to Browser workspace)"
echo "Report any issues found"
```

## Performance Considerations

### Input Lag
- **Minimal overhead**: Karabiner adds ~1ms input lag
- **Optimization**: Disable unnecessary rules
- **Monitoring**: Watch for lag in fast typing

### Resource Usage
- **Memory**: Typical usage ~10-20MB RAM
- **CPU**: Minimal CPU usage during normal operation
- **Battery**: Negligible impact on battery life

### Startup Time
- **Login delay**: Adds ~1-2 seconds to login process
- **Profile switching**: Instant profile changes
- **Rule loading**: Complex rules may slow startup

## Security Considerations

### Permissions Required
- **Input Monitoring**: Full keyboard access
- **Accessibility**: Window management access
- **Administrative**: Initial installation only

### Privacy Implications
- **Keystroke logging**: Technical capability exists
- **Local processing**: All processing happens locally
- **No network**: No data sent over network
- **Open source**: Code is publicly auditable

### Best Practices
1. **Download from official sources**: Avoid modified versions
2. **Review permissions**: Only grant necessary permissions
3. **Regular updates**: Keep software updated
4. **Profile management**: Use different profiles for different contexts

## Future Plans

### When to Activate
Activate Karabiner-Elements when:
1. **Ready for full workflow**: Comfortable with Aerospace
2. **Keyboard muscle memory**: Used to current shortcuts
3. **Stable setup**: Other tools working properly
4. **Time for testing**: Can troubleshoot if needed

### Migration Strategy
1. **Test in isolation**: Activate only Karabiner first
2. **Verify functionality**: Ensure Space key works correctly
3. **Gradual integration**: Start with basic Aerospace commands
4. **Full workflow**: Integrate with all workspace shortcuts

### Rollback Plan
If issues occur:
1. **Disable profile**: Switch to "Default" profile
2. **Uninstall if needed**: Remove Karabiner-Elements completely
3. **Alternative approaches**: Use different modifier keys
4. **Temporary solutions**: Manual window management until resolved

## Documentation References

- **Official Docs**: https://karabiner-elements.pqrs.org/docs/
- **Configuration Reference**: https://karabiner-elements.pqrs.org/docs/json/
- **Troubleshooting**: https://karabiner-elements.pqrs.org/docs/help/
- **Community Examples**: https://github.com/pqrs-org/KE-complex_modifications