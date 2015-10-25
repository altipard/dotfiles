" AutoCommands{
        if has("autocmd") && !exists("autocommands_loaded")
            let autocommands_loaded=1

            " When editing a file, always jump to the last known cursor position.
            " Don't do it when the position is invalid or when inside an event handler
            " (happens when dropping a file on gvim).
            autocmd BufReadPost *
              \ if line("'\"") > 0 && line("'\"") <= line("$") |
              \   exe "normal g`\"" |
              \ endif

            " add cusstom commentstring for nginx
            autocmd FileType nginx let &l:commentstring='#%s'
            autocmd FileType eco let &l:commentstring='<!-- %s -->'

            " Rope
            autocmd FileType python let ropevim_guess_project=1

            " abbrevations
            autocmd FileType python abbr kpdb import pdb; pdb.set_trace()
            autocmd FileType python abbr kipdb from ipdb import set_trace; set_trace()
            autocmd FileType python abbr iemb from IPython import embed; embed()

            " VIM footers
            autocmd FileType css abbr kvim /* vim: set ft=css ts=4 sw=4 expandtab : */
            autocmd FileType javascript abbr kvim /* vim: set ft=javscript ts=4 sw=4 expandtab : */
            autocmd FileType rst abbr kvim .. vim: set ft=rst ts=4 sw=4 expandtab tw=78 :
            autocmd FileType python abbr kvim # vim: set ft=python ts=4 sw=4 expandtab :
            autocmd FileType xml abbr kvim <!-- vim: set ft=xml ts=2 sw=2 expandtab : -->
            autocmd FileType html abbr kvim <!-- vim: set ft=html ts=2 sw=2 expandtab : -->
            autocmd FileType changelog abbr kvim vim: set ft=changelog ts=4 sw=4 expandtab :
            autocmd FileType cfg abbr kvim # vim: set ft=cfg ts=4 sw=4 expandtab :
            autocmd FileType config abbr kvim # vim: set ft=config ts=4 sw=4 expandtab :
            autocmd FileType coffee abbr kvim # vim: set ft=coffee ts=4 sw=4 expandtab :

            autocmd FileType * abbr ddate <C-R>=strftime("%Y-%m-%d")<CR>
            autocmd FileType * abbr nname Daniel Altiparmak<CR>
            autocmd FileType * abbr mmail daniel.altiparmak@inquant.de<CR>

            autocmd BufNewFile *daily/*.rst 0r ~/.vim/skeletons/daily.rst
            autocmd BufNewFile *.py ks|call FileName()|'s
            autocmd BufNewFile *.py ks|call Created()|'s
            autocmd BufWritePre,FileWritePre * ks|call LastModified()|'s

            autocmd FileType coffee abbr kmod :r ~/.vim/skeletons/skeleton.coffee
            autocmd FileType python abbr kmod :r ~/.vim/skeletons/skeleton.py
            autocmd FileType python abbr khead :r ~/.vim/skeletons/skeleton.head
            autocmd FileType rst abbr kmod :r ~/.vim/skeletons/skeleton.rst
            autocmd FileType zpt abbr kmod :r ~/.vim/skeletons/skeleton.pt
            autocmd FileType html abbr kmod :r ~/.vim/skeletons/skeleton.html
            autocmd FileType changelog abbr kmod :r ~/.vim/skeletons/skeleton.changelog
            autocmd FileType xml abbr kmod :r ~/.vim/skeletons/skeleton.zcml

            fun FileName()
                if line("$") > 20
                    let l = 20
                else
                    let l = line("$")
                endif
                exe "1," . l . "g/File Name: /s/File Name: .*/File Name: " .
                \ expand("%")
            endfun

            fun Created()
                if line("$") > 20
                    let l = 20
                else
                    let l = line("$")
                endif
                exe "1," . l . "g/Creation Date: /s/Creation Date: .*/Creation Date: " .
                \ strftime("%Y %b %d")
            endfun

            fun LastModified()
                if line("$") > 20
                    let l = 20
                else
                    let l = line("$")
                endif
                exe "1," . l . "g/Last Modified: /s/Last Modified: .*/Last Modified: " .
                \ strftime("%Y %b %d")
            endfun
        endif
" }
