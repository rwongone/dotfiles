nnoremap <leader>teh :vsp term://zsh<CR>
nnoremap <leader>tev :sp term://zsh<CR>

" In terminal mode, ignore common typo resulting in CSI u sequence
tnoremap <S-space> <space>
tnoremap <S-BS> <BS>

autocmd TermOpen * setlocal nonumber norelativenumber
