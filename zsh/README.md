# Zsh Configuration

Advanced Zsh setup with enhanced aliases, intelligent history, and modern tool integrations.

## Overview

This configuration provides a powerful shell environment with:
- Enhanced aliases for Git, system commands, and development tools
- Intelligent history management with deduplication
- Modern tool integrations (fzf, zoxide, syntax highlighting)
- Vi mode with proper cursor styling
- Modular configuration system

## Files Structure

```
zsh/
├── zshrc                    # Main configuration file
├── enhanced-aliases.zsh     # Advanced aliases with fzf integration
├── enhanced-settings.zsh    # Shell options, history, and tool integrations
├── theme-config.zsh         # Theme system and performance optimizations
└── integration-snippet.zsh # Reference for manual integration
```

## Key Features

### Enhanced Git Workflow
- **Interactive file selection**: `gafzf`, `gcofzf`, `grfzf` (requires fzf)
- **Quick shortcuts**: `gss` (short status), `gup` (fetch+rebase), `glgg` (graph log)
- **One-liner commits**: `gcq "message"` (add, commit, push)

### Smart Directory Navigation
- **Zoxide integration**: `cd` becomes smart with frequency-based suggestions
- **Quick navigation**: `...` (cd ../..), `....` (cd ../../..)
- **Directory creation**: `mkcd dirname` (create and enter)

### Development Tools
- **fzf integration**: Enhanced fuzzy finding with preview
- **Syntax highlighting**: Real-time command validation
- **Autosuggestions**: Fish-like suggestions based on history
- **Vi mode**: With proper cursor styling (beam/block)

### History Management
- **Intelligent deduplication**: No duplicate commands
- **Cross-session sharing**: History shared between all terminals
- **Large capacity**: 1M commands stored
- **Extended format**: Timestamps and duration tracking

## Aliases Reference

### Git Aliases
| Alias | Command | Description |
|-------|---------|-------------|
| `g` | `git` | Git shorthand |
| `gs` | `git status` | Repository status |
| `gss` | `git status -s` | Short status format |
| `ga` | `git add` | Stage files |
| `gc` | `git commit` | Commit changes |
| `gp` | `git push` | Push to remote |
| `gl` | `git pull` | Pull from remote |
| `gco` | `git checkout` | Switch branches |
| `gb` | `git branch` | List branches |
| `gd` | `git diff` | Show differences |
| `glgg` | `git log --graph...` | Pretty graph log |

### Interactive Git (requires fzf)
| Alias | Description |
|-------|-------------|
| `gafzf` | Interactive file staging |
| `gcofzf` | Interactive branch switching |
| `grfzf` | Interactive file restoration |
| `grsfzf` | Interactive staged file restoration |

### System Aliases
| Alias | Command | Description |
|-------|---------|-------------|
| `ll` | `ls -alF` | Detailed file list |
| `la` | `ls -A` | Show hidden files |
| `cat` | `bat` | Syntax-highlighted cat |
| `..` | `cd ..` | Go up one directory |
| `...` | `cd ../..` | Go up two directories |
| `c` | `clear` | Clear terminal |
| `e` | `exit` | Exit shell |

### Development Aliases
| Alias | Command | Description |
|-------|---------|-------------|
| `py` | `python` | Python shorthand |
| `pip` | `uv pip` | Modern pip replacement |
| `venv` | `uv venv` | Virtual environment |
| `activate` | `source .venv/bin/activate` | Activate venv |
| `reload` | `source ~/.zshrc` | Reload shell config |
| `lg` | `lazygit` | Git TUI |
| `weather` | `curl wttr.in` | Terminal weather |

## Functions

### mkcd
Create directory and navigate into it:
```bash
mkcd new-project  # Creates and enters 'new-project' directory
```

### extract
Universal archive extraction:
```bash
extract file.tar.gz    # Extracts any supported archive format
extract file.zip
extract file.7z
```

### gcq
Quick commit workflow:
```bash
gcq "Fix bug in parser"  # Stages all, commits with message, and pushes
```

## Tool Integration

### fzf (Fuzzy Finder)
- **File search**: `Ctrl+T` for file selection
- **Command history**: `Ctrl+R` for history search
- **Directory navigation**: `Alt+C` for directory selection
- **Enhanced previews**: Automatic file content preview

### Zoxide (Smart cd)
- **Frequency-based**: Learns your directory usage patterns
- **Fuzzy matching**: `z proj` finds `/home/user/projects`
- **Interactive mode**: `zi` for interactive selection

### Syntax Highlighting
- **Real-time validation**: Commands are highlighted as you type
- **Error detection**: Invalid commands shown in red
- **Path completion**: Valid paths highlighted in green

### Autosuggestions
- **History-based**: Suggests commands from your history
- **Accept with**: `Right arrow` or `Ctrl+F`
- **Partial accept**: `Ctrl+Right arrow` for word-by-word

## Vi Mode

### Key Bindings
- **Mode switching**: `Esc` for normal mode, `i` for insert mode
- **Navigation**: `h/j/k/l` for movement in normal mode
- **Line editing**: `A` (end), `I` (beginning), `dd` (delete line)
- **Visual cursor**: Block cursor in normal mode, beam in insert mode

### Enhanced Bindings
| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+R` | Any | History search |
| `Ctrl+A` | Any | Beginning of line |
| `Ctrl+E` | Any | End of line |
| `Ctrl+K` | Any | Kill to end of line |
| `Ctrl+U` | Any | Kill whole line |

## XDG Base Directory

Organizes configuration files according to XDG specification:
- **Config**: `~/.config/` for application configurations
- **Cache**: `~/.cache/` for temporary files
- **Data**: `~/.local/share/` for application data
- **State**: `~/.local/state/` for application state

## Performance Optimizations

### Lazy Loading
- **NVM**: Only loads when `nvm` command is used
- **Tool checks**: Features only activate if tools are installed
- **Conditional sourcing**: Files only sourced if they exist

### Startup Time
- **Minimal core**: Essential features load first
- **Deferred loading**: Heavy tools load on demand
- **Smart detection**: Automatic tool availability checking

## Customization

### Local Overrides
Create `~/.zshrc.local` for machine-specific settings that won't be tracked by git.

### Adding Custom Aliases
Add to `enhanced-aliases.zsh` or create a new `.zsh` file in the zsh directory.

### Theme Customization
Edit `theme-config.zsh` to modify:
- FZF colors and behavior
- Tool-specific themes
- Environment variables

## Troubleshooting

### Missing Tools
The configuration gracefully handles missing tools. Install recommended tools:
```bash
# Core tools
brew install fzf zoxide bat ripgrep

# Optional enhancements
brew install lazygit thefuck direnv
brew install zsh-syntax-highlighting zsh-autosuggestions
```

### Slow Startup
If shell startup is slow:
1. Check which tools are being loaded
2. Disable heavy integrations temporarily
3. Use `zsh -xvs` to debug loading time

### Vi Mode Issues
If vi mode cursor doesn't work:
1. Ensure terminal supports cursor sequences
2. Check terminal's cursor settings
3. Test with different terminal emulators

## Integration with Other Tools

### Tmux
- Automatic tmux session creation
- Shared history between tmux panes
- Vi mode works inside tmux

### Starship Prompt
- Git status integration
- Command duration display
- Error code indication

### Terminal Emulators
- Tested with: iTerm2, Kitty, Ghostty, Terminal.app
- Full unicode support
- 256-color compatibility