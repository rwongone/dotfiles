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
set title
set noeb vb t_vb=
set nobackup
set noswapfile
noremap <F2> :set invpaste paste?<CR>i
set pastetoggle=<F2>

"Performance settings.
set ttyfast
set lazyredraw

"Scroll settings.
set scrolloff=6

" No startup message.
set shortmess+=I

" Replace all occurences in line by default.
set gdefault

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

" Use ; instead of :.
nnoremap ; :
vnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vnoremap Q gq
nnoremap Q gqap

" Highlight cursor on <leader>c.
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Highlight cursor line number.
set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

" Hybrid line numbering.
set nu rnu
autocmd InsertEnter * :set rnu! | :set nu
autocmd InsertLeave * :set rnu | :set nu
set mouse=nv
