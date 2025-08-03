# Dotfiles Cheat Sheet

Quick reference for all keyboard shortcuts, commands, and workflows in the development environment.

## Table of Contents

- [Zsh & Terminal](#zsh--terminal)
- [Git Aliases](#git-aliases)
- [Tmux](#tmux)
- [Neovim](#neovim)
- [Kitty Terminal](#kitty-terminal)
- [Aerospace Window Manager](#aerospace-window-manager)
- [Development Workflows](#development-workflows)

---

## Zsh & Terminal

### Essential Aliases
| Alias | Command | Description |
|-------|---------|-------------|
| `ll` | `ls -alF` | Detailed file listing |
| `la` | `ls -A` | Show hidden files |
| `cat` | `bat` | Syntax-highlighted cat |
| `..` | `cd ..` | Go up one directory |
| `...` | `cd ../..` | Go up two directories |
| `c` | `clear` | Clear terminal |
| `e` | `exit` | Exit shell |
| `reload` | `source ~/.zshrc` | Reload shell config |

### Development Shortcuts
| Alias | Command | Description |
|-------|---------|-------------|
| `py` | `python` | Python shorthand |
| `pip` | `uv pip` | Modern pip replacement |
| `venv` | `uv venv` | Create virtual environment |
| `activate` | `source .venv/bin/activate` | Activate Python venv |
| `lg` | `lazygit` | Git TUI interface |
| `weather` | `curl wttr.in` | Terminal weather |
| `myip` | `curl ipinfo.io/ip` | Show public IP |

### Functions
| Function | Usage | Description |
|----------|-------|-------------|
| `mkcd` | `mkcd project` | Create and enter directory |
| `extract` | `extract file.zip` | Universal archive extraction |
| `gcq` | `gcq "message"` | Quick commit (add, commit, push) |

### Navigation (with zoxide)
| Command | Description |
|---------|-------------|
| `z project` | Jump to directory containing "project" |
| `zi` | Interactive directory selection |

---

## Git Aliases

### Basic Git Operations
| Alias | Command | Description |
|-------|---------|-------------|
| `g` | `git` | Git shorthand |
| `gs` | `git status` | Repository status |
| `gss` | `git status -s` | Short status format |
| `ga` | `git add` | Stage files |
| `gc` | `git commit` | Commit changes |
| `gcm` | `git commit -m` | Commit with message |
| `gp` | `git push` | Push to remote |
| `gl` | `git pull` | Pull from remote |
| `gf` | `git fetch` | Fetch from remote |

### Branch Operations
| Alias | Command | Description |
|-------|---------|-------------|
| `gb` | `git branch` | List branches |
| `gbr` | `git branch -r` | List remote branches |
| `gco` | `git checkout` | Switch branches |
| `gcob` | `git checkout -b` | Create and switch branch |
| `gm` | `git merge` | Merge branches |

### Git History & Info
| Alias | Command | Description |
|-------|---------|-------------|
| `gd` | `git diff` | Show differences |
| `gl` | `git log --oneline` | Compact log |
| `glgg` | `git log --graph --max-count=5 --decorate --pretty="oneline"` | Graph log |
| `gup` | `git fetch && git rebase` | Update with rebase |

### Interactive Git (requires fzf)
| Alias | Description |
|-------|-------------|
| `gafzf` | Interactive file staging |
| `gcofzf` | Interactive branch switching |
| `grfzf` | Interactive file restoration |
| `grsfzf` | Interactive staged file restoration |

---

## Tmux

### Prefix Key: `Ctrl+a`

### Session Management
| Key | Action |
|-----|--------|
| `Prefix + d` | Detach session |
| `Prefix + s` | List sessions |
| `Prefix + $` | Rename session |
| `Prefix + r` | Reload config |

### Window Management
| Key | Action |
|-----|--------|
| `Prefix + ß` | New window (German keyboard) |
| `Alt + h` | Previous window |
| `Alt + l` | Next window |
| `Alt + 1-9` | Switch to window by number |
| `Prefix + &` | Kill window |
| `Prefix + ,` | Rename window |

### Pane Management
| Key | Action |
|-----|--------|
| `Prefix + \|` | Split vertically |
| `Prefix + -` | Split horizontally |
| `Prefix + h/j/k/l` | Navigate panes (Vim style) |
| `Prefix + H/J/K/L` | Resize panes |
| `Prefix + z` | Zoom/unzoom pane |
| `Prefix + x` | Kill pane |

### Copy Mode
| Key | Action |
|-----|--------|
| `Prefix + [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy selection |
| `Prefix + ]` | Paste |

---

## Neovim

### Leader Key: `Space`

### File Operations
| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>e` | Toggle file explorer |

### Telescope (Fuzzy Finder)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Switch buffers |
| `<leader>fh` | Help tags |

### LSP Functions
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format document |

### Harpoon (Quick Navigation)
| Key | Action |
|-----|--------|
| `<leader>a` | Add file to harpoon |
| `<C-e>` | Toggle harpoon menu |
| `<C-h>` | Jump to file 1 |
| `<C-t>` | Jump to file 2 |
| `<C-n>` | Jump to file 3 |
| `<C-s>` | Jump to file 4 |

### Buffer Management
| Key | Action |
|-----|--------|
| `<leader>bp` | Previous buffer |
| `<leader>bn` | Next buffer |
| `<leader>bd` | Delete buffer |

### Window Navigation
| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to bottom window |
| `<C-k>` | Move to top window |
| `<C-l>` | Move to right window |

---

## Kitty Terminal

### Window Management
| Key | Action |
|-----|--------|
| `Cmd+Enter` | New window |
| `Cmd+W` | Close window |
| `Cmd+Shift+]` | Next window |
| `Cmd+Shift+[` | Previous window |
| `Cmd+1-9` | Window by number |

### Tab Management
| Key | Action |
|-----|--------|
| `Cmd+T` | New tab |
| `Cmd+Shift+W` | Close tab |
| `Cmd+Shift+Right` | Next tab |
| `Cmd+Shift+Left` | Previous tab |

### Font and Display
| Key | Action |
|-----|--------|
| `Cmd++` | Increase font size |
| `Cmd+-` | Decrease font size |
| `Cmd+0` | Reset font size |
| `Cmd+Shift+F11` | Toggle fullscreen |

### Search
| Key | Action |
|-----|--------|
| `Cmd+F` | Search in scrollback |
| `Cmd+G` | Find next |
| `Cmd+Shift+G` | Find previous |

---

## Aerospace Window Manager

### Prefix: Hold `Space` key = Meh-Key (Shift+Ctrl+Alt)

### Workspace Navigation
| Key | Workspace | Apps |
|-----|-----------|------|
| `Space+B` | Browser | Chrome, Safari, Firefox |
| `Space+C` | Code | VSCode, IntelliJ |
| `Space+M` | Messages | WhatsApp, Mail, Slack |
| `Space+T` | Terminal | iTerm, Terminal, Ghostty |
| `Space+V` | Video | Zoom, Teams |
| `Space+D` | Documentation | Obsidian, Notion |
| `Space+E` | Entertainment | Spotify, YouTube |
| `Space+F` | Finder | File management |
| `Space+G` | Git | GitHub Desktop |
| `Space+N` | Notes | Note-taking apps |
| `Space+P` | Productivity | Calendar, Reminders |
| `Space+W` | Work | Work-specific apps |
| `Space+1-9` | Numeric | Overflow workspaces |

### Window Management
| Key | Action |
|-----|--------|
| `Space+H/J/K/L` | Focus window (Vim style) |
| `Space+Cmd+H/J/K/L` | Move window |
| `Space+Cmd+Letter` | Move window to workspace |
| `Space+Space` | Toggle layout |
| `Space+Enter` | Fullscreen |
| `Space+Q` | Close window |

### Resize Mode
| Key | Action |
|-----|--------|
| `Space+;` | Enter resize mode |
| `H/J/K/L` | Resize (50px steps) |
| `Shift+H/J/K/L` | Fine resize (10px steps) |
| `Esc` or `Enter` | Exit resize mode |

---

## Development Workflows

### New Project Setup
```bash
# 1. Create and navigate to project
mkcd my-project

# 2. Initialize git repository
git init
git add .
gcq "Initial commit"

# 3. Open in editor
nvim .

# 4. Start tmux session
tmux new-session -d -s my-project
```

### Git Workflow
```bash
# 1. Check status
gs

# 2. Interactive staging (if fzf available)
gafzf

# 3. Quick commit and push
gcq "Feature: Add new functionality"

# 4. Create new branch
gcob feature/new-feature

# 5. Interactive branch switching
gcofzf
```

### Development Session
```bash
# 1. Start tmux session
tmux new -s dev

# 2. Split for editor
# Prefix + |

# 3. Split for terminal
# Prefix + -

# 4. Navigate with Aerospace
# Space+C (code workspace)
# Space+T (terminal workspace)
```

### Code Navigation (Neovim)
```bash
# 1. Open project
nvim .

# 2. Find files quickly
<leader>ff

# 3. Search in files
<leader>fg

# 4. Mark important files
<leader>a (harpoon)

# 5. Quick switch between files
<C-h>, <C-t>, <C-n>, <C-s>
```

### Terminal Multiplexing
```bash
# 1. Create named session
tmux new -s project-name

# 2. Create windows for different tasks
# Prefix + ß (new window)
# - Window 1: Editor
# - Window 2: Server
# - Window 3: Tests
# - Window 4: Logs

# 3. Navigate with Alt+numbers
# Alt+1, Alt+2, Alt+3, Alt+4

# 4. Detach when done
# Prefix + d

# 5. Reattach later
tmux attach -t project-name
```

### Debugging Workflow
```bash
# 1. Split tmux pane for logs
# Prefix + -

# 2. Tail logs in one pane
tail -f app.log

# 3. Run tests in another
npm test -- --watch

# 4. Edit code in main pane
nvim src/main.js

# 5. Use harpoon to quickly switch between problem files
```

### Performance Monitoring
```bash
# 1. System monitoring
htop

# 2. Git performance
lazygit

# 3. Network monitoring
# Use Aerospace Space+S for system tools

# 4. Docker monitoring (if applicable)
lazydocker
```

---

## Quick Tips

### Productivity Hacks
1. **Use Harpoon**: Mark 4 most important files for instant access
2. **Leverage fzf**: Interactive file and branch selection
3. **Tmux sessions**: One session per project
4. **Aerospace workspaces**: Organize apps by function
5. **Git aliases**: Muscle memory for common operations

### Troubleshooting
1. **Reload configs**: `reload` for zsh, `Prefix+r` for tmux
2. **Check tool installation**: Most features gracefully degrade
3. **Font issues**: Ensure Nerd Font is installed and configured
4. **Performance**: Disable unused integrations

### Learning Path
1. Start with basic git aliases and tmux
2. Learn Neovim navigation and LSP features
3. Master Aerospace window management
4. Customize based on your workflow
5. Share configurations with team

---

## Emergency Commands

### Kill Stuck Processes
```bash
# Kill all tmux sessions
tmux kill-server

# Kill specific tmux session
tmux kill-session -t session-name

# Force quit application
killall -9 ApplicationName
```

### Config Recovery
```bash
# Restore default zsh config
mv ~/.zshrc ~/.zshrc.backup
cp ~/.dotfiles/zsh/zshrc ~/.zshrc

# Restart shell
exec zsh

# Reload tmux config
tmux source-file ~/.tmux.conf
```

### Git Recovery
```bash
# Undo last commit (keep changes)
git reset --soft HEAD~1

# Reset to clean state
git reset --hard HEAD

# Restore deleted file
git checkout HEAD -- filename
```

---

## Customization Quick Start

### Add Custom Alias
Edit `~/.dotfiles/zsh/enhanced-aliases.zsh`:
```bash
alias myalias='command here'
```

### Add Custom Tmux Binding
Edit `~/.dotfiles/tmux/tmux.conf`:
```bash
bind-key x new-command
```

### Add Custom Neovim Mapping
Edit `~/.dotfiles/nvim/lua/core/keymaps.lua`:
```lua
vim.keymap.set('n', '<leader>x', ':CustomCommand<CR>')
```

### Add Custom Aerospace Workspace
Edit `~/.dotfiles/aerospace/aerospace.toml`:
```toml
[workspace-to-monitor-force-assignment]
X = 'main'
```

Remember: Always test configurations before committing changes!