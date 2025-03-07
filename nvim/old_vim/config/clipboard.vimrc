" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Copy path of curent buffer to clipboard
command! CopyRelPath call setreg('+', expand('%'))
nnoremap <leader>[ :CopyRelPath<CR>
vnoremap <leader>[ :CopyRelPath<CR>
