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

" Set leader key
let mapleader=" "

" Hit jk to escape
inoremap jk <esc>

set numberwidth=3

set hidden
set tabstop=4
set backspace=indent,eol,start
set smartindent
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set expandtab
set hlsearch
set incsearch

set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set noeb vb t_vb=

set nobackup
set noswapfile

noremap <F2> :set invpaste paste?<CR>i
set pastetoggle=<F2>

"Performance settings.
set ttyfast
set lazyredraw
"set synmaxcol=300

"Scroll settings.
set scrolloff=6

" No startup message.
set shortmess+=I

" Replace all occurences in line by default.
set gdefault

" Use <leader>p to open ctrlp
" let g:ctrlp_map = '<leader>p'
" Ignore these directories
set wildignore+=*/build/**
set wildignore+=*.class
" disable caching
" let g:ctrlp_use_caching=0

" Enable omnicomplete.
set omnifunc=syntaxcomplete#Complete

" Consistent yank.
nnoremap Y y$

filetype plugin indent on
"autocmd filetype python set expandtab
autocmd filetype make set noexpandtab

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Lines
" Delete line
nnoremap <leader>d dd
" Shift line down
noremap <leader>- ddp
" Shift line up
noremap <leader>_ ddkp

" Edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Disable some default keys
inoremap <esc> <nop>

" Disable some nuisance keys
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

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

" nnoremap <silent> ,/ :nohlsearch<CR>
" nnoremap <leader>p :CtrlP .<CR>

" Use ; instead of :.
nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

" Next search result, next paragraph centers cursor.
nnoremap n nzz
nnoremap } }zz

" Toggle NERDTree.
" nnoremap <leader>d :NERDTreeToggle<CR>

" Highlight cursor on <leader>c.
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Trim trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" Syntax highlighting.
syntax on
colorscheme monokai
hi NonText cterm=NONE ctermfg=NONE
hi Normal ctermbg=NONE

" au BufReadPost,BufNewFile *.twig colorscheme koehler
" au BufReadPost,BufNewFile *.css colorscheme slate
" au BufReadPost,BufNewFile *.js colorscheme slate2
au BufReadPost,BufNewFile *.py set colorcolumn=80
" au BufReadPost,BufNewFile *.html colorscheme monokai

autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'

autocmd FileType tex setlocal shiftwidth=2 tabstop=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 tabstop=4
autocmd FileType jsx setlocal shiftwidth=4 tabstop=4 tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=4 tabstop=4 tabstop=4

set number
set rnu
autocmd InsertEnter * :set rnu! | :set nu
autocmd InsertLeave * :set rnu! | :set nu!

let delimitMate_expand_cr = 1

" FZF
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_tags_command = 'ctags -R --exclude=test --exclude=spec --exclude=node_modules --exclude=build --exclude=target'

nnoremap <silent> <leader>o :Tags<CR>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>P :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>. :Ag!<CR>
nnoremap <silent> <leader>gl :Commits<CR>


command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options' : '--delimiter : --nth 4..'}, 'up:60%'))

set mouse=nv
