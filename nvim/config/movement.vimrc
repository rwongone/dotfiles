" Row by row movement instead of line by line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Navigate splits
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Navigate tabs
nnoremap <C-H> gT
nnoremap <C-L> gt
nnoremap <leader>t     :tabnew<CR>
nnoremap <leader>w     :tabclose<CR>
inoremap <C-H> <Esc>gTi
inoremap <C-L> <Esc>gti
inoremap <leader>t     <Esc>:tabnew<CR>
inoremap <leader>w     <Esc>:tabclose<CR>

noremap <Right> <nop>
noremap <Left> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
