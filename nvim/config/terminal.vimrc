" default new splits to right and bottom
set splitbelow
set splitright

" Row by row movement instead of line by line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Navigate splits
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Navigate tabs
nnoremap <S-H> gT
nnoremap <S-L> gt
nnoremap <C-H> :-tabm<CR>
nnoremap <C-L> :+tabm<CR>
nnoremap <leader>y     :tabnew<CR>:tabmove<CR>
nnoremap <leader>w     :tabclose<CR>

noremap <Right> <nop>
noremap <Left> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
