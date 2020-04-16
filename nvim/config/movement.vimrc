" default new splits to right and bottom
set splitbelow
set splitright

" Row by row movement instead of line by line
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Open splits
nnoremap <leader>th :vsp<CR>
nnoremap <leader>tv :sp<CR>

" Navigate splits
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Navigate tabs
nnoremap <S-H> gT
nnoremap <S-L> gt
nnoremap <leader>w     :tabclose<CR>

noremap <Right> <nop>
noremap <Left> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
