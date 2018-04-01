autocmd FileType tex setlocal shiftwidth=2 tabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 tabstop=4
autocmd FileType jsx setlocal shiftwidth=4 tabstop=4 tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=4 tabstop=4 tabstop=4

" Automatically strip trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
