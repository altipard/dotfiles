# Tmux Cheatsheet - German Keyboard Layout

## Key Commands

Start a new session
```shell
tmux new -s SessionName
```

Exit session (detach)
```shell
tmux detach
# or Prefix + d
```

List sessions
```shell
tmux ls
```

Attach to session
```shell
tmux attach -t SessionName
```

Kill session
```shell
tmux kill-session -t SessionName
```

Show all available options
```shell
tmux show-options -g
```

Show all available shortcuts
```shell
tmux list-keys
```

Show all available commands
```shell
tmux list-commands
```

Reload configuration
```shell
tmux source-file ~/.tmux.conf
# or Prefix + r
```

Start fresh (kill all sessions)
```shell
tmux kill-server && rm -rf /tmp/tmux-*
```

## Essential Shortcuts

**Prefix Key: `Ctrl + a`** (Changed from default Ctrl + b)

### Session Management
- **Detach from session**: `Prefix + d`
- **Choose session**: `Prefix + Ctrl + s`
- **Show session tree**: `Prefix + Ctrl + p`

### Window Management
- **Create new window**: `Prefix + ß` (German character) or `Prefix + c`
- **Navigate to window by number**: `Alt + 1-9` (direct access)
- **Previous window**: `Alt + h` (German keyboard friendly)
- **Next window**: `Alt + l` (German keyboard friendly)
- **Choose window**: `Prefix + Ctrl + w`
- **Close window**: `Prefix + X` (with confirmation)
- **Rename window**: `Prefix + ,`

### Pane Management

#### Creating Panes (German Umlauts)
- **Horizontal split**: `Prefix + ü` (German character)
- **Vertical split**: `Prefix + ö` (German character)
- **Alternative horizontal**: `Prefix + "`
- **Alternative vertical**: `Prefix + %`

#### Navigating Panes (Vim-style)
- **Move left**: `Prefix + h`
- **Move down**: `Prefix + j`
- **Move up**: `Prefix + k`
- **Move right**: `Prefix + l`

#### Resizing Panes
**German Characters:**
- **Resize left**: `Prefix + ä`
- **Resize right**: `Prefix + +`
- **Resize up**: `Prefix + ^`
- **Resize down**: `Prefix + -`

**Alt + Arrow Keys (Easier):**
- **Resize left**: `Alt + ←`
- **Resize right**: `Alt + →`
- **Resize up**: `Alt + ↑`
- **Resize down**: `Alt + ↓`

#### Other Pane Commands
- **Show pane numbers**: `Prefix + q`
- **Close current pane**: `Prefix + x`

### Copy Mode (Vim-style)
- **Enter copy mode**: `Prefix + v`
- **Start selection**: `v` (in copy mode)
- **Copy selection**: `y` (in copy mode)
- **Rectangle selection**: `Ctrl + v` (in copy mode)
- **Exit copy mode**: `Escape`

### Plugin Management (TPM)
- **Install plugins**: `Prefix + I`
- **Update plugins**: `Prefix + U`
- **Remove plugins**: `Prefix + Alt + u`

### Session Persistence (Resurrect/Continuum)
- **Save session**: `Prefix + Ctrl + s`
- **Restore session**: `Prefix + Ctrl + r`
- **Auto-save**: Every 15 minutes (configured)
- **Auto-restore**: On tmux start (configured)

## Color Theme

**Current Theme: Nordic** (Nord-inspired colors)
- Background: `#3B4252` (Polar Night)
- Foreground: `#D8DEE9` (Snow Storm)
- Active Window: `#88C0D0` (Frost Cyan)
- Session: `#A3BE8C` (Aurora Green)

## Configuration Files

- **Main config**: `~/.dotfiles/tmux/tmux.conf`
- **Nordic theme**: `~/.dotfiles/tmux/nordic-theme.conf`

## Useful Snippets

### Auto-start tmux session in .zshrc
```shell
# Always work in a tmux session if tmux is installed
if command -v tmux &> /dev/null; then
    if [[ -z "$TMUX" ]] && [[ $TERM != "screen-256color" ]] && [[ $TERM != "screen" ]]; then
        tmux attach -t main || tmux new -s main
    fi
fi
```

### Create a development session
```shell
#!/bin/bash
# Create a development session with multiple windows
tmux new-session -d -s dev -n editor
tmux new-window -t dev:2 -n terminal
tmux new-window -t dev:3 -n server
tmux select-window -t dev:1
tmux attach-session -t dev
```

## German Keyboard Specific Features

This configuration is optimized for German keyboards:

- **Umlauts for pane splitting**: `ü` (horizontal), `ö` (vertical)
- **German characters for resizing**: `ä`, `+`, `^`, `-`
- **ß for new windows**: Quick access with German character
- **Alt key navigation**: Alt + h/l for window switching
- **Alt + numbers**: Direct window access (1-9)

## Plugin List

Current active plugins:
- **TPM**: Plugin manager
- **tmux-sensible**: Sensible defaults
- **vim-tmux-navigator**: Seamless vim/tmux navigation
- **tmux-resurrect**: Session persistence
- **tmux-continuum**: Automatic session save/restore

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│                   TMUX QUICK REFERENCE                     │
├─────────────────────────────────────────────────────────────┤
│ Prefix: Ctrl + a                                           │
├─────────────────────────────────────────────────────────────┤
│ Sessions: d=detach, C-s=choose, C-p=tree                   │
│ Windows:  ß=new, Alt+h/l=prev/next, Alt+1-9=direct       │
│ Panes:    ü=h-split, ö=v-split, hjkl=navigate             │
│ Resize:   Alt+arrows or ä+-^                              │
│ Copy:     v=copy-mode, v=select, y=copy                   │
│ Plugins:  I=install, U=update                             │
│ Persist:  C-s=save, C-r=restore                           │
└─────────────────────────────────────────────────────────────┘
```

## Troubleshooting

### If plugins don't work:
```shell
# Reinstall TPM
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Reload config and install
tmux source ~/.tmux.conf
# Press Prefix + I
```

### If theme doesn't load:
```shell
# Check if theme file exists
ls ~/.dotfiles/tmux/nordic-theme.conf
# Reload configuration
tmux source ~/.tmux.conf
```

### If umlauts don't work:
- Ensure your terminal supports UTF-8
- Check keyboard layout is set to German
- Verify LANG environment variable: `echo $LANG`