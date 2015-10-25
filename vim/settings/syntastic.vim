let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
                           \  'active_filetypes': ['python', 'c', 'js'],
                           \ 'passive_filetypes': ['html'] }
" need to edit pylint config before it is usable
" let g:syntastic_python_checkers = ['pep8', 'flake8', 'pylint']
let g:syntastic_python_checkers = ['pep8', 'flake8']

let g:syntastic_c_checkers = ['gcc', 'make', 'ycm']
let g:syntastic_c_compiler_options = '-Wall'

let g:syntastic_cpp_compiler_options = '-std=gnu++14'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1

" let g:syntastic_javascript_checkers = ['jscs', 'jshint', 'eslint']
let g:syntastic_javascript_checkers = ['eslint']
" expands when defined, not when used.
" let g:syntastic_sh_shellcheck_args = ['--exclude=SC2139']
let g:syntastic_aggregate_errors = 1
