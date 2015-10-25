let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_enable_clipboard     = 0

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = ' '
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_marked_file_icon = '✓'

" Convenience:
nmap <Leader>v :<C-u>VimFilerExplorer -winwidth=28<CR>
nmap <Leader>,v :<C-u>VimFiler<CR>
