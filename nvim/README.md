# Neovim Configuration

Modern Neovim setup with LSP, Treesitter, and essential plugins for productive development.

## Overview

This configuration provides a feature-rich Neovim environment with:
- Language Server Protocol (LSP) integration
- Advanced syntax highlighting with Treesitter
- File explorer and fuzzy finding
- Modern UI with bufferline and statusline
- Quick navigation with Harpoon
- Color theme customization

## Files Structure

```
nvim/
├── init.lua                 # Main configuration entry point
├── lazy-lock.json          # Plugin version lockfile
└── lua/
    ├── core/
    │   ├── options.lua      # Neovim options and settings
    │   └── keymaps.lua      # Key bindings and shortcuts
    └── plugins/
        ├── bufferline.lua   # Buffer/tab management
        ├── colortheme.lua   # Color scheme configuration
        ├── harpoon.lua      # Quick file navigation
        ├── lsp.lua          # Language server setup
        ├── lualine.lua      # Status line configuration
        ├── neotree.lua      # File explorer
        ├── telescope.lua    # Fuzzy finder
        └── treesitter.lua   # Syntax highlighting
```

## Plugin Management

Uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management:
- **Lazy loading**: Plugins load only when needed
- **Lockfile**: `lazy-lock.json` ensures reproducible installs
- **Auto-install**: Missing plugins are installed automatically
- **Performance**: Fast startup with optimized loading

## Core Plugins

### LSP (Language Server Protocol)
- **Auto-completion**: Intelligent code completion
- **Diagnostics**: Real-time error and warning detection
- **Go-to definition**: Navigate to symbol definitions
- **Hover documentation**: Inline documentation display
- **Code actions**: Automated refactoring and fixes

### Treesitter
- **Advanced syntax highlighting**: Better than regex-based highlighting
- **Code folding**: Intelligent code structure folding
- **Text objects**: Smart selection of code blocks
- **Incremental parsing**: Fast syntax tree updates

### Telescope
- **File finder**: Fuzzy file searching
- **Live grep**: Search content across files
- **Buffer picker**: Quick buffer switching
- **Command palette**: Search and execute commands
- **Git integration**: Browse git files and commits

### Neo-tree
- **File explorer**: Visual file system navigation
- **Git status**: See file changes in tree view
- **Buffer management**: Close/switch buffers from tree
- **Quick actions**: Create, delete, rename files

### Harpoon
- **Quick navigation**: Mark and jump between files
- **Project-specific**: File marks per project
- **Fast switching**: Instant file access
- **Minimal overhead**: Lightweight navigation system

### UI Enhancements
- **Bufferline**: Tab-like buffer management
- **Lualine**: Informative status line
- **Color themes**: Customizable appearance

## Key Bindings

### General Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>` | `<Space>` | Leader key for custom mappings |
| `<C-h/j/k/l>` | Window navigation | Move between splits |
| `<leader>w` | `:w<CR>` | Save file |
| `<leader>q` | `:q<CR>` | Quit |

### File Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Toggle Neo-tree | Open/close file explorer |
| `<leader>ff` | Telescope find files | Fuzzy file finder |
| `<leader>fg` | Telescope live grep | Search in files |
| `<leader>fb` | Telescope buffers | Switch between buffers |
| `<leader>fh` | Telescope help tags | Search help documentation |

### LSP Functions
| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to definition | Jump to symbol definition |
| `gD` | Go to declaration | Jump to symbol declaration |
| `gr` | Go to references | Find all references |
| `K` | Hover documentation | Show documentation |
| `<leader>ca` | Code actions | Show available fixes |
| `<leader>rn` | Rename symbol | Rename across project |
| `<leader>f` | Format document | Auto-format code |

### Harpoon Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>a` | Add file | Mark current file |
| `<C-e>` | Toggle menu | Show marked files |
| `<C-h>` | File 1 | Jump to first marked file |
| `<C-t>` | File 2 | Jump to second marked file |
| `<C-n>` | File 3 | Jump to third marked file |
| `<C-s>` | File 4 | Jump to fourth marked file |

### Buffer Management
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>bp` | Previous buffer | Switch to previous buffer |
| `<leader>bn` | Next buffer | Switch to next buffer |
| `<leader>bd` | Delete buffer | Close current buffer |
| `<leader>bD` | Force delete | Force close without saving |

## LSP Language Support

The configuration automatically sets up LSP for common languages:
- **JavaScript/TypeScript**: tsserver
- **Python**: pyright or pylsp
- **Lua**: lua_ls
- **Go**: gopls
- **Rust**: rust_analyzer
- **JSON**: jsonls
- **HTML/CSS**: html, cssls

### Adding New Languages
1. Install the language server (via Mason or system package manager)
2. Add configuration to `lua/plugins/lsp.lua`
3. Restart Neovim

## Customization

### Color Themes
Edit `lua/plugins/colortheme.lua` to change themes:
```lua
-- Available themes: tokyonight, catppuccin, nord, etc.
return {
  "folke/tokyonight.nvim",
  config = function()
    vim.cmd("colorscheme tokyonight-night")
  end
}
```

### Key Bindings
Modify `lua/core/keymaps.lua` to customize shortcuts:
```lua
-- Add custom key binding
vim.keymap.set('n', '<leader>x', ':CustomCommand<CR>', { desc = 'Custom action' })
```

### Options
Adjust editor behavior in `lua/core/options.lua`:
```lua
-- Example options
vim.opt.tabstop = 4        -- Tab width
vim.opt.shiftwidth = 4     -- Indent width
vim.opt.expandtab = true   -- Use spaces instead of tabs
```

### Plugin Configuration
Each plugin has its own file in `lua/plugins/`. Modify these files to customize plugin behavior.

## Troubleshooting

### LSP Not Working
1. Check if language server is installed: `:checkhealth lsp`
2. Verify server is running: `:LspInfo`
3. Install missing servers: `:Mason`

### Slow Performance
1. Check startup time: `nvim --startuptime startup.log`
2. Disable unused plugins in plugin files
3. Use lazy loading for heavy plugins

### Plugin Issues
1. Update plugins: `:Lazy update`
2. Check plugin status: `:Lazy`
3. Clear plugin cache: `:Lazy clear`

### Telescope Not Finding Files
1. Ensure ripgrep is installed: `brew install ripgrep`
2. Check git repository status
3. Verify file permissions

## Installation

The Neovim configuration is automatically installed with the main dotfiles installation:

```bash
cd ~/.dotfiles
./install.sh
```

### Manual Installation
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Symlink new config
ln -sf ~/.dotfiles/nvim ~/.config/nvim

# Start Neovim (plugins will install automatically)
nvim
```

## Dependencies

Required tools for full functionality:
```bash
# Core dependencies
brew install neovim ripgrep fd

# Language servers (optional, install as needed)
brew install typescript-language-server
brew install lua-language-server
pip install python-lsp-server
```

## Performance Tips

### Lazy Loading
- Plugins load only when needed
- Use events and commands for lazy loading
- Avoid loading all plugins at startup

### Startup Optimization
- Use `:Lazy profile` to identify slow plugins
- Defer non-essential plugins
- Use native Neovim features when possible

### Memory Usage
- Close unused buffers regularly
- Use `:Lazy clean` to remove unused plugins
- Monitor memory with `:checkhealth`

## Integration with Terminal

### Tmux Integration
- Seamless navigation between tmux panes and Neovim splits
- Shared clipboard functionality
- Consistent key bindings

### Shell Integration
- Use `$EDITOR` environment variable
- Git commit message editing
- Command line file editing

## Advanced Features

### Custom Commands
Create custom commands for common workflows:
```lua
-- Example: Format and save
vim.api.nvim_create_user_command('FormatSave', function()
  vim.lsp.buf.format()
  vim.cmd('write')
end, {})
```

### Auto Commands
Set up automatic actions:
```lua
-- Auto-format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  callback = function()
    vim.lsp.buf.format()
  end,
})
```

### Plugin Development
- Use local plugin development setup
- Test configurations before committing
- Create plugin-specific branches for testing