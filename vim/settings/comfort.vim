"Fast saving of a buffer:"
nmap <leader>w :w!<cr>

" lets you indent your selection as many time as you want
vnoremap < <gv
vnoremap > >gv

" Key (re)Mappings {
    " move in split windows with ctrl key
    nmap <c-up> <up>
    nmap <c-down> <down>
    nmap <c-right> <right>
    nmap <c-left> <left>
    nmap <c-s-up> <up> _
    nmap <c-s-down> <down> _

    " move in split windows for mac with apple key
    nmap <D-Up> <Up>
    nmap <D-Down> <Down>
    nmap <D-Right> <Right>
    nmap <D-Left> <Left>
    nmap <D-S-Up> <Up>_
    nmap <D-S-Down> <Down>_

    " go to next / previous tab
    map  <d-left>  :tabp <cr>
    imap <d-left>  <esc> :tabp <cr> i
    map  <d-right> :tabn <cr>
    imap <d-right> <esc> :tabn <cr> i

" }

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
