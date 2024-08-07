call plug#begin()
Plug 'BurntSushi/ripgrep' " required for telescope
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'github/copilot.vim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvim-lua/plenary.nvim' " required for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make', 'branch': 'main' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Vimjas/vim-python-pep8-indent',  { 'for': 'python' }
Plug 'janko/vim-test'
Plug 'KKPMW/vim-sendtowindow'
Plug 'sharkdp/fd' " optional for telescope
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'williamboman/mason.nvim', { 'branch': 'main' }
Plug 'williamboman/mason-lspconfig.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
call plug#end()

let g:jsx_ext_required = 0
let delimitMate_expand_cr = 1

" fzf
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_tags_command = 'ctags -R --exclude=test --exclude=spec --exclude=node_modules --exclude=build --exclude=target'
let g:fzf_action = { 'space': 'tab split' }
let g:fzf_buffers_jump = 1

nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>. :Ag!<CR>
nnoremap <silent> <leader>gl :Commits<CR>
"nnoremap <silent> <leader>' :Telescope find_files<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
endfunction

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options' : '--delimiter : --nth 4..'}, 'up:60%'))

" Save as SVG to allow clickable links with :PlantumlSave.
let g:plantuml_previewer#save_format = 'png'
