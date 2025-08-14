#!/usr/bin/env zsh
# ============================================================================
# Gruvbox Theme Configuration for Zsh
# ============================================================================

# Gruvbox Dark color palette
export GRUVBOX_BG0='#282828'
export GRUVBOX_BG1='#3c3836'
export GRUVBOX_BG2='#504945'
export GRUVBOX_BG3='#665c54'
export GRUVBOX_BG4='#7c6f64'
export GRUVBOX_FG0='#fbf1c7'
export GRUVBOX_FG1='#ebdbb2'
export GRUVBOX_FG2='#d5c4a1'
export GRUVBOX_FG3='#bdae93'
export GRUVBOX_FG4='#a89984'
export GRUVBOX_RED='#fb4934'
export GRUVBOX_GREEN='#b8bb26'
export GRUVBOX_YELLOW='#fabd2f'
export GRUVBOX_BLUE='#83a598'
export GRUVBOX_PURPLE='#d3869b'
export GRUVBOX_AQUA='#8ec07c'
export GRUVBOX_ORANGE='#fe8019'
export GRUVBOX_GRAY='#928374'

# Enhanced LS_COLORS for Gruvbox theme
export LS_COLORS='di=1;34:ln=1;36:so=1;35:pi=33:ex=1;32:bd=1;33:cd=1;33:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:*.tar=1;31:*.tgz=1;31:*.arc=1;31:*.arj=1;31:*.taz=1;31:*.lha=1;31:*.lz4=1;31:*.lzh=1;31:*.lzma=1;31:*.tlz=1;31:*.txz=1;31:*.tzo=1;31:*.t7z=1;31:*.zip=1;31:*.z=1;31:*.dz=1;31:*.gz=1;31:*.lrz=1;31:*.lz=1;31:*.lzo=1;31:*.xz=1;31:*.zst=1;31:*.tzst=1;31:*.bz2=1;31:*.bz=1;31:*.tbz=1;31:*.tbz2=1;31:*.tz=1;31:*.deb=1;31:*.rpm=1;31:*.jar=1;31:*.war=1;31:*.ear=1;31:*.sar=1;31:*.rar=1;31:*.alz=1;31:*.ace=1;31:*.zoo=1;31:*.cpio=1;31:*.7z=1;31:*.rz=1;31:*.cab=1;31:*.wim=1;31:*.swm=1;31:*.dwm=1;31:*.esd=1;31:*.jpg=1;35:*.jpeg=1;35:*.mjpg=1;35:*.mjpeg=1;35:*.gif=1;35:*.bmp=1;35:*.pbm=1;35:*.pgm=1;35:*.ppm=1;35:*.tga=1;35:*.xbm=1;35:*.xpm=1;35:*.tif=1;35:*.tiff=1;35:*.png=1;35:*.svg=1;35:*.svgz=1;35:*.mng=1;35:*.pcx=1;35:*.mov=1;35:*.mpg=1;35:*.mpeg=1;35:*.m2v=1;35:*.mkv=1;35:*.webm=1;35:*.webp=1;35:*.ogm=1;35:*.mp4=1;35:*.m4v=1;35:*.mp4v=1;35:*.vob=1;35:*.qt=1;35:*.nuv=1;35:*.wmv=1;35:*.asf=1;35:*.rm=1;35:*.rmvb=1;35:*.flc=1;35:*.avi=1;35:*.fli=1;35:*.flv=1;35:*.gl=1;35:*.dl=1;35:*.xcf=1;35:*.xwd=1;35:*.yuv=1;35:*.cgm=1;35:*.emf=1;35:*.ogv=1;35:*.ogx=1;35:*.aac=1;36:*.au=1;36:*.flac=1;36:*.m4a=1;36:*.mid=1;36:*.midi=1;36:*.mka=1;36:*.mp3=1;36:*.mpc=1;36:*.ogg=1;36:*.ra=1;36:*.wav=1;36:*.oga=1;36:*.opus=1;36:*.spx=1;36:*.xspf=1;36:*.pdf=1;33:*.ps=1;33:*.ps.gz=1;33:*.txt=0;37:*.patch=0;37:*.diff=0;37:*.log=0;37:*.tex=0;37:*.xls=1;33:*.xlsx=1;33:*.doc=1;33:*.docx=1;33:*.ppt=1;33:*.pptx=1;33:*.odt=1;33:*.ods=1;33:*.odp=1;33:*.epub=1;33:*.abw=1;33:*.wpd=1;33:*.sxc=1;33:*.sxw=1;33:*.md=1;37:*.markdown=1;37:*.rst=1;37:*.c=1;32:*.C=1;32:*.cc=1;32:*.cpp=1;32:*.cxx=1;32:*.objc=1;32:*.sh=1;32:*.bash=1;32:*.zsh=1;32:*.fish=1;32:*.csh=1;32:*.h=1;32:*.hpp=1;32:*.inc=1;32:*.c++=1;32:*.hh=1;32:*.H=1;32:*.ii=1;32:*.M=1;32:*.i=1;32:*.S=1;32:*.swig=1;32:*.f=1;32:*.for=1;32:*.f77=1;32:*.f90=1;32:*.f95=1;32:*.f03=1;32:*.f08=1;32:*.nim=1;32:*.nims=1;32:*.nimble=1;32:*.s=1;32:*.S=1;32:*.rs=1;31:*.go=1;34:*.php=1;32:*.phtml=1;32:*.twig=1;32:*.py=1;32:*.pyc=1;32:*.pyd=1;32:*.pyo=1;32:*.ipynb=1;32:*.rb=1;32:*.gemspec=1;32:*.ru=1;32:*.erb=1;32:*.slim=1;32:*.haml=1;32:*.sass=1;32:*.scss=1;32:*.less=1;32:*.styl=1;32:*.coffee=1;32:*.js=1;32:*.jsx=1;32:*.ts=1;32:*.tsx=1;32:*.vue=1;32:*.elm=1;32:*.clj=1;32:*.cljs=1;32:*.cljc=1;32:*.edn=1;32:*.lua=1;32:*.dart=1;32:*.kt=1;32:*.kts=1;32:*.java=1;32:*.groovy=1;32:*.gradle=1;32:*.m=1;32:*.pl=1;32:*.pm=1;32:*.t=1;32:*.raku=1;32:*.rakumod=1;32:*.rakutest=1;32:*.pm6=1;32:*.p6=1;32:*.pod=1;32:*.r=1;32:*.R=1;32:*.Rd=1;32:*.Rmd=1;32:*.Rnw=1;32:*.Rtex=1;32:*.Rout=1;32:*.stan=1;32:*.jl=1;32:*.ml=1;32:*.mli=1;32:*.mll=1;32:*.mly=1;32:*.hs=1;32:*.lhs=1;32:*.hsc=1;32:*.zig=1;32:*.v=1;32:*.vhd=1;32:*.vhdl=1;32:*.ucf=1;32:*.arb=1;32:*.xdc=1;32:*.sdc=1;32:*.tcl=1;32:*.sw?=1;32:*.bak=1;32:*.aux=1;32:*.lof=1;32:*.lol=1;32:*.lot=1;32:*.toc=1;32:*.bbl=1;32:*.blg=1;32:*~=1;32:*.swp=1;32:*.tmp=1;32:*.temp=1;32:*.o=1;32:*.pyc=1;32:*.pyo=1;32:*.luac=1;32:*.class=1;32:*.cache=1;32:*.dll=1;32:*.dylib=1;32:*.so=1;32:*.lai=1;32:*.la=1;32:*.a=1;32:*.lib=1;32:*.rlib=1;32:*.rmeta=1;32:*.bc=1;32:*.ko=1;32:*.elf=1;32:*.node=1;32:*.cmi=1;32:*.cmo=1;32:*.cmx=1;32:*.cma=1;32:*.cmxa=1;32:*.obj=1;32:*.mi=1;32:*.hi=1;32:*.chi=1;32:*.mod=1;32:*.p_hi=1;32:*.p_o=1;32:*.vo=1;32:*.vok=1;32:*.vos=1;32:*.annot=1;32:*.cmt=1;32:*.cmti=1;32:*.cgi=1;32:*.cgit=1;32:*.git=1;32:*.dep=1;32:*.dpkg=1;32:*.log=1;32:*.zwc=1;32:*.pid=1;32:*.state=1;32:*.dump=1;32:*.stackdump=1;32:*.zcompdump=1;32:*.lock=1;32:*.lockfile=1;32:*.tmp=1;32:*.temp=1;32:*.db=1;32:*.sqlite=1;32:*.sqlite3=1;32:*.typelib=1;32:*.pdb=1;32:*.idb=1;32:*.pch=1;32:*.gch=1;32:*.dyn_hi=1;32:*.dyn_o=1;32:*.p_dyn_hi=1;32:*.p_dyn_o=1;32:*.chi=1;32:*.chs.h=1;32:*.dwo=1;32:*.yaml=1;33:*.yml=1;33:*.json=1;33:*.jsonc=1;33:*.json5=1;33:*.hjson=1;33:*.jsonnet=1;33:*.libsonnet=1;33:*.jsonld=1;33:*.ipynb=1;33:*.ndjson=1;33:*.jsonl=1;33:*.yaml.lock=1;33:*.hcl=1;33:*.tfvars=1;33:*.tf=1;33:*.tfstate=1;33:*.tfplan=1;33:*.pp=1;33:*.epp=1;33:*.pom.xml=1;33:*.cfg=1;33:*.conf=1;33:*.config=1;33:*.ini=1;33:*.rc=1;33:*.vim=1;33:*.vimrc=1;33:*.viml=1;33:*.viminfo=1;33:*.bashrc=1;33:*.bash_profile=1;33:*.bash_login=1;33:*.profile=1;33:*.zshrc=1;33:*.zshenv=1;33:*.zprofile=1;33:*.zlogin=1;33:*.zlogout=1;33:*.oh-my-zsh=1;33:*.gitconfig=1;33:*.gitignore=1;33:*.gitignore_global=1;33:*.gitattributes=1;33:*.gitmodules=1;33:*.gitkeep=1;33:*.hgrc=1;33:*.hgignore=1;33'

# Configure Zsh colors for better terminal experience
autoload -U colors && colors

# Enable better file type coloring in completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Gruvbox-themed directory colors for zsh
export LSCOLORS='ExGxFxdaCxDaDahbadacec'

# Set terminal title with Gruvbox-style formatting
precmd() {
    print -Pn "\e]0;%~\a"
}

# Enhanced prompt colors for Zsh (if not using Starship)
# This is a fallback if Starship is not available
if ! command -v starship &> /dev/null; then
    PROMPT='%F{208}%n%f@%F{142}%m%f:%F{109}%~%f %F{142}$%f '
    RPROMPT='%F{245}%*%f'
fi

# Syntax highlighting colors for zsh-syntax-highlighting (if installed)
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    # Main highlighting
    ZSH_HIGHLIGHT_STYLES[default]='fg=187'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=167,bold'
    ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=142'
    ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=142,underline'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=142,underline'
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=208'
    ZSH_HIGHLIGHT_STYLES[path]='fg=109'
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=245'
    ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=245'
    ZSH_HIGHLIGHT_STYLES[globbing]='fg=214'
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=214'
    
    # Command highlighting
    ZSH_HIGHLIGHT_STYLES[command]='fg=142'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=142'
    ZSH_HIGHLIGHT_STYLES[alias]='fg=142'
    ZSH_HIGHLIGHT_STYLES[global-alias]='fg=108'
    ZSH_HIGHLIGHT_STYLES[function]='fg=142'
    
    # Arguments and options
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=208'
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=208'
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=108'
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=175'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=175'
    ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=175'
    ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=108'
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=108'
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=108'
    ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=108'
    ZSH_HIGHLIGHT_STYLES[assign]='none'
    ZSH_HIGHLIGHT_STYLES[redirection]='fg=187'
    ZSH_HIGHLIGHT_STYLES[comment]='fg=245,italic'
    ZSH_HIGHLIGHT_STYLES[arg0]='fg=142'
fi

# Autosuggestion colors (if zsh-autosuggestions is installed)
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
fi

# FZF Gruvbox theme (if fzf is installed)
if command -v fzf &> /dev/null; then
    export FZF_DEFAULT_OPTS='
    --color=bg+:#3c3836,bg:#282828,spinner:#fb4934,hl:#928374
    --color=fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934
    --color=marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934
    --border="rounded" --border-label="" --preview-window="border-rounded"
    --prompt="> " --marker=">" --pointer="◆"
    --separator="─"'
fi

# Bat theme (if bat is installed)
if command -v bat &> /dev/null; then
    export BAT_THEME="gruvbox-dark"
fi

# Less colors for man pages (Gruvbox style)
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;33m'     # begin blink
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\e[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

# Colorful man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Message
echo "🎨 Gruvbox theme loaded for Zsh"