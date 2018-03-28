call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'Vimjas/vim-python-pep8-indent',  { 'for': 'python' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:jsx_ext_required = 0
let delimitMate_expand_cr = 1

" FZF
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_tags_command = 'ctags -R --exclude=test --exclude=spec --exclude=node_modules --exclude=build --exclude=target'
let g:fzf_action = { 'space': 'tab split' }

nnoremap <silent> <leader>o :Tags<CR>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>P :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>. :Ag!<CR>
nnoremap <silent> <leader>gl :Commits<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options' : '--delimiter : --nth 4..'}, 'up:60%'))
