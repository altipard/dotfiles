# Starship Prompt Configuration

Cross-shell prompt with git integration and language detection using Nord theme.

## Overview

Starship provides:
- Fast, cross-shell prompt (zsh, bash, fish, PowerShell)
- Git status integration with branch and status indicators
- Language and runtime detection (Python, Node.js, Rust, Go, etc.)
- Customizable modules and themes
- Minimal performance impact

## Files Structure

```
starship/
├── starship.toml    # Main configuration file
└── README.md        # This documentation
```

## Key Features

### Git Integration
- **Branch display**: Current git branch with icon
- **Status indicators**: Modified, staged, untracked files
- **Ahead/behind**: Commit status relative to remote
- **Stash indicator**: Shows when stash exists
- **Clean state**: Visual indication of clean working tree

### Language Detection
- **Runtime versions**: Shows active language versions
- **Project detection**: Detects project types automatically
- **Version managers**: Integrates with nvm, pyenv, rbenv, etc.
- **Package info**: Shows package versions when relevant

### Performance
- **Async execution**: Modules run in parallel
- **Caching**: Intelligent caching of expensive operations
- **Lazy loading**: Only shows relevant information
- **Fast rendering**: Minimal delay in prompt display

## Prompt Layout

```
~/projects/my-app on  main [!?] ····················· 🐍 3.9.0  16:42:33
❯ 
```

### Components (left to right)
1. **Directory**: Current path with icons for special folders
2. **Git branch**: Current branch with git icon
3. **Git status**: File modification indicators
4. **Fill**: Dynamic spacing to right-align information
5. **Language**: Active runtime version
6. **Time**: Current time
7. **Character**: Prompt character (changes color on error)

## Configuration Details

### Directory Module
```toml
[directory]
style = 'bold fg:dark_blue'
format = '[$path ]($style)'
truncation_length = 3
truncation_symbol = '…/'
truncate_to_repo = false
```

Features:
- **Icons**: Special folders show icons (Documents, Downloads, etc.)
- **Truncation**: Long paths are shortened intelligently
- **Styling**: Bold blue for better visibility
- **Git awareness**: Can truncate to repository root

### Git Branch Module
```toml
[git_branch]
style = 'fg:green'
symbol = ' '
format = '[on](white) [$symbol$branch ]($style)'
```

Features:
- **Icon**: Git branch symbol
- **Color**: Green for active branch
- **Context**: "on" prefix for clarity
- **Truncation**: Long branch names are shortened

### Git Status Module
```toml
[git_status]
style = 'fg:red'
conflicted = '=${count} '
ahead = '⇡${count} '
behind = '⇣${count} '
diverged = '⇕⇡${ahead_count}⇣${behind_count} '
up_to_date = ' '
untracked = '?${count} '
stashed = '$${count} '
modified = '!${count} '
staged = '+${count} '
renamed = '»${count} '
deleted = '✘${count} '
```

Status Indicators:
- `!` Modified files
- `?` Untracked files  
- `+` Staged files
- `$` Stashed changes
- `⇡` Commits ahead
- `⇣` Commits behind
- `=` Merge conflicts
- `✘` Deleted files

### Language Modules

#### Python
```toml
[python]
symbol = '🐍 '
style = 'fg:yellow'
format = '[$symbol$pyversion]($style) '
detect_extensions = ['py']
detect_files = ['requirements.txt', 'pyproject.toml', 'Pipfile']
```

#### Node.js
```toml
[nodejs]
symbol = ' '
style = 'fg:green'
format = '[$symbol$version]($style) '
detect_files = ['package.json', '.nvmrc']
```

#### Rust
```toml
[rust]
symbol = ' '
style = 'fg:red'
format = '[$symbol$version]($style) '
detect_files = ['Cargo.toml']
```

#### Go
```toml
[golang]
symbol = ' '
style = 'fg:cyan'
format = '[$symbol$version]($style) '
detect_files = ['go.mod', 'go.sum']
```

### Special Modules

#### Command Duration
```toml
[cmd_duration]
min_time = 2000
style = 'fg:yellow'
format = '[$duration]($style) '
```
Shows execution time for commands taking longer than 2 seconds.

#### Jobs Indicator
```toml
[jobs]
symbol = '+ '
style = 'fg:blue'
format = '[$symbol$number]($style) '
```
Shows number of background jobs.

#### AWS Context
```toml
[aws]
symbol = '☁️ '
style = 'fg:orange'
format = '[$symbol$profile]($style) '
```
Shows active AWS profile when AWS CLI is configured.

## Nord Color Palette

The configuration uses the Nord color scheme:

```toml
[palettes.nord]
dark_blue = '#5E81AC'
blue = '#81A1C1'
teal = '#88C0D0'
red = '#BF616A'
orange = '#D08770'
green = '#A3BE8C'
yellow = '#EBCB8B'
purple = '#B48EAD'
gray = '#434C5E'
black = '#2E3440'
white = '#ECEFF4'
```

### Color Usage
- **Directory**: Dark blue for paths
- **Git branch**: Green for active branch
- **Git status**: Red for file changes
- **Python**: Yellow for Python version
- **Node.js**: Green for Node version
- **Rust**: Red for Rust version
- **Go**: Cyan for Go version

## Customization

### Adding New Modules
Add to the format string and configure the module:
```toml
format = """
$directory\
$git_branch\
$git_status\
$docker_context\
$fill\
$python\
$character"""

[docker_context]
symbol = '🐳 '
style = 'fg:blue'
format = '[$symbol$context]($style) '
```

### Custom Symbols
Replace default icons with preferred symbols:
```toml
[git_branch]
symbol = '⎇ '  # Alternative git symbol

[python]
symbol = 'py '  # Text instead of emoji
```

### Performance Tuning
Disable expensive modules for faster prompts:
```toml
# Disable modules that are slow in your environment
[aws]
disabled = true

[gcloud]
disabled = true
```

### Right Prompt
Move modules to right side:
```toml
right_format = """$time"""

[time]
disabled = false
style = 'fg:gray'
format = '[$time]($style)'
```

## Integration

### Shell Setup
The prompt is automatically configured in your zsh setup:
```bash
# In zshrc
eval "$(starship init zsh)"
```

### Environment Variables
Starship respects common environment variables:
- `STARSHIP_CONFIG`: Custom config file path
- `STARSHIP_CACHE`: Cache directory location
- `NO_COLOR`: Disable colors entirely

### Version Managers
Works with popular version managers:
- **nvm**: Node.js version management
- **pyenv**: Python version management  
- **rbenv**: Ruby version management
- **rustup**: Rust toolchain management

## Troubleshooting

### Slow Prompt
1. **Identify slow modules**: Use `starship explain` to see module execution times
2. **Disable expensive modules**: Turn off unused language detectors
3. **Check git status**: Large repositories can slow git modules
4. **Update starship**: Newer versions have performance improvements

### Missing Icons
1. **Install Nerd Font**: Download from [Nerd Fonts](https://www.nerdfonts.com/)
2. **Configure terminal**: Set terminal to use Nerd Font
3. **Fallback symbols**: Use text symbols instead of icons
4. **Test display**: Run `starship test` to verify rendering

### Wrong Language Detection
1. **Check detection files**: Verify files exist for language detection
2. **Update detection**: Add custom file patterns
3. **Path issues**: Ensure language binaries are in PATH
4. **Version manager**: Check if version manager is properly loaded

### Git Status Issues
1. **Large repositories**: Git status can be slow in large repos
2. **Submodules**: Complex git setups may cause issues
3. **Permissions**: Check file permissions in git directory
4. **Git version**: Ensure recent git version is installed

## Advanced Features

### Conditional Modules
Show modules only in specific conditions:
```toml
[kubernetes]
disabled = false
format = '[$symbol$context]($style) '
[kubernetes.context_aliases]
'dev-cluster' = 'dev'
'prod-cluster' = 'prod'
```

### Custom Commands
Execute custom commands in modules:
```toml
[custom.package_version]
command = 'cat package.json | jq -r .version'
when = 'test -f package.json'
symbol = '📦 '
style = 'fg:purple'
format = '[$symbol$output]($style) '
```

### Battery Module
Show battery status on laptops:
```toml
[battery]
full_symbol = '🔋'
charging_symbol = '⚡'
discharging_symbol = '💀'

[[battery.display]]
threshold = 10
style = 'bold red'

[[battery.display]]
threshold = 30
style = 'bold yellow'
```

## Performance Optimization

### Caching
Starship automatically caches expensive operations:
- Git status results
- Language version detection
- Command execution results

### Async Execution
Modules run in parallel for faster rendering:
- Independent modules execute simultaneously
- Network-dependent modules timeout appropriately
- Local operations prioritized over remote

### Selective Loading
Only relevant modules are executed:
- Language modules only run in relevant projects
- Git modules only run in git repositories
- Cloud modules only run when tools are configured

## Migration from Other Prompts

### From Oh My Zsh
Replace theme configuration:
```bash
# Remove from .zshrc
# ZSH_THEME="robbyrussell"

# Add starship initialization
eval "$(starship init zsh)"
```

### From Powerlevel10k
Similar functionality with simpler configuration:
- Git integration comparable
- Language detection equivalent
- Performance similar or better
- Configuration more portable

### Custom Prompt Scripts
Replace custom PS1 with starship configuration:
- Convert colors to starship format
- Map components to starship modules
- Test thoroughly before switching

## Installation

### Automatic Installation
```bash
cd ~/.dotfiles
./install.sh
```

### Manual Installation
```bash
# Install starship
brew install starship

# Create config directory
mkdir -p ~/.config

# Symlink configuration
ln -sf ~/.dotfiles/starship/starship.toml ~/.config/starship.toml

# Add to shell config
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

### Font Requirements
Install a Nerd Font for proper icon display:
```bash
# Install JetBrains Mono Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

## Tips and Best Practices

### Configuration
- Start with default config and customize gradually
- Test changes with `starship test` before committing
- Use version control for configuration files
- Document custom modifications

### Performance
- Monitor prompt rendering time
- Disable modules you don't use
- Use caching for expensive operations
- Consider network latency for cloud modules

### Aesthetics
- Maintain consistent color scheme
- Balance information density with readability
- Use icons sparingly for better compatibility
- Test in different terminal sizes

### Team Sharing
- Keep configuration portable across systems
- Document required dependencies
- Provide fallbacks for missing tools
- Consider different team member preferences