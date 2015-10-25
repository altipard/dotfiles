" Make it beautiful - colors and fonts

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2")
    " using Source Code Pro
    set anti enc=utf-8
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 15, Envy\ Code\ R\ 14,Inconsolata\ 15,Monaco\ 12
  else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h16,Inconsolata:h20,Monaco:h17
  end
else
  let g:CSApprox_loaded = 1

endif

colorscheme gruvbox
set background=dark
