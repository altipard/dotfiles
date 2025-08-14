#!/usr/bin/env zsh
# Nord theme colors for ls/eza/lsd
# Based on Nord color palette: https://www.nordtheme.com/

# ============================================================================
# Nord Color Palette Reference
# ============================================================================
# Polar Night (dark backgrounds)
# nord0: #2E3440 (darkest)
# nord1: #3B4252
# nord2: #434C5E
# nord3: #4C566A (lightest dark)
#
# Snow Storm (light foregrounds)
# nord4: #D8DEE9 (darkest light)
# nord5: #E5E9F0
# nord6: #ECEFF4 (lightest)
#
# Frost (blues/teals)
# nord7: #8FBCBB (teal)
# nord8: #88C0D0 (light blue)
# nord9: #81A1C1 (blue)
# nord10: #5E81AC (dark blue)
#
# Aurora (colorful)
# nord11: #BF616A (red)
# nord12: #D08770 (orange)
# nord13: #EBCB8B (yellow)
# nord14: #A3BE8C (green)
# nord15: #B48EAD (purple)

# ============================================================================
# LS_COLORS for standard ls command
# ============================================================================
# Format: TYPE=STYLE;FOREGROUND;BACKGROUND

# Basic file types
LS_COLORS="di=1;34"          # Directories: bold blue (nord9)
LS_COLORS+=":ln=1;36"        # Symlinks: bold cyan (nord8)
LS_COLORS+=":ex=1;32"        # Executables: bold green (nord14)
LS_COLORS+=":fi=0"           # Regular files: default
LS_COLORS+=":bd=1;33"        # Block devices: bold yellow
LS_COLORS+=":cd=1;33"        # Character devices: bold yellow
LS_COLORS+=":pi=33"          # Named pipes: yellow
LS_COLORS+=":so=1;35"        # Sockets: bold magenta

# Archives & Compressed files (nord10 - dark blue)
for ext in tar zip gz bz2 xz 7z rar iso dmg; do
    LS_COLORS+=":*.${ext}=1;34"
done

# Images (nord15 - purple)
for ext in jpg jpeg png gif bmp svg ico webp; do
    LS_COLORS+=":*.${ext}=1;35"
done

# Videos (nord12 - orange)
for ext in mp4 avi mkv mov wmv flv webm; do
    LS_COLORS+=":*.${ext}=1;33"
done

# Audio (nord13 - yellow)
for ext in mp3 wav flac aac ogg wma; do
    LS_COLORS+=":*.${ext}=33"
done

# Documents (nord4 - light)
for ext in pdf doc docx txt md rst tex; do
    LS_COLORS+=":*.${ext}=37"
done

# Code files (nord14 - green)
for ext in py js ts jsx tsx c cpp h hpp go rs java rb php; do
    LS_COLORS+=":*.${ext}=32"
done

# Config files (nord8 - light blue)
for ext in json yaml yml toml ini conf config; do
    LS_COLORS+=":*.${ext}=36"
done

# Version control (nord7 - teal)
LS_COLORS+=":*.git=2;37"
LS_COLORS+=":*.gitignore=2;37"
LS_COLORS+=":*.gitmodules=2;37"

export LS_COLORS

# ============================================================================
# EZA_COLORS (if you have eza installed - modern ls replacement)
# ============================================================================
if command -v eza &> /dev/null; then
    # Eza uses a different format but similar concepts
    export EZA_COLORS="di=1;34:ex=1;32:ln=1;36:*.md=37:*.py=32:*.js=32:*.json=36"
fi

# ============================================================================
# LSD Configuration (if you have lsd installed - another ls replacement)
# ============================================================================
if command -v lsd &> /dev/null; then
    # LSD uses LS_COLORS by default, so we're already configured
    alias ls='lsd'
    alias ll='lsd -la'
    alias lt='lsd --tree'
fi

# ============================================================================
# macOS specific settings
# ============================================================================
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Enable color output for ls on macOS
    export CLICOLOR=1
    
    # LSCOLORS for BSD ls (macOS default)
    # Format: foreground-background pairs for each file type
    # a=black, b=red, c=green, d=brown, e=blue, f=magenta, g=cyan, h=white
    # Capital letters = bold
    # x = default
    export LSCOLORS="ExGxFxdxCxDxDxBxBxExEx"
    
    # Use GNU ls if available (from coreutils)
    if command -v gls &> /dev/null; then
        alias ls='gls --color=auto'
        alias ll='gls -alF --color=auto'
        alias la='gls -A --color=auto'
        alias l='gls -CF --color=auto'
    else
        # Fallback to BSD ls with color
        alias ls='ls -G'
        alias ll='ls -alFG'
        alias la='ls -AG'
        alias l='ls -CFG'
    fi
fi

# ============================================================================
# Enhanced aliases with colors
# ============================================================================
alias tree='tree -C'  # Colored tree output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ============================================================================
# Optional: Install better ls alternatives
# ============================================================================
# To get even better Nord-themed file listings, consider installing:
# 
# 1. eza (modern, maintained replacement for ls):
#    brew install eza
#
# 2. lsd (ls with icons and colors):
#    brew install lsd
#
# Both respect the LS_COLORS we've set and add extra features like
# icons, git integration, and better formatting.

# Nord theme colors loaded successfully