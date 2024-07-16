" Enable omnicomplete.
" set omnifunc=syntaxcomplete#Complete

" Syntax highlighting.
colorscheme tokyonight-moon
hi NonText cterm=NONE ctermfg=NONE
hi Normal ctermbg=NONE

au BufReadPost,BufNewFile *.py set colorcolumn=80

autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
syntax on
