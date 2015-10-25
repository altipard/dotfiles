" Settings for showmarks.vim
 if has("gui_running")
     let g:showmarks_enable=0
 else
     let g:showmarks_enable=0
     let loaded_showmarks=1
 endif

let g:showmarks_include='abcdefghijklmnopqrstuvwxyz' . 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:showmarks_ignore_type=""
let g:showmarks_textlower="\t"
let g:showmarks_textupper="\t"
let g:showmarks_textother="\t"
let g:showmarks_auto_toggle = 0
nnoremap <silent> mo :ShowMarksOn<CR>

nnoremap <silent> mt :ShowMarksToggle<CR>
