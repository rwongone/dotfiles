call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'Vimjas/vim-python-pep8-indent',  { 'for': 'python' }
Plug 'janko/vim-test'
Plug 'KKPMW/vim-sendtowindow'
call plug#end()

let g:jsx_ext_required = 0
let delimitMate_expand_cr = 1

" FZF
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_tags_command = 'ctags -R --exclude=test --exclude=spec --exclude=node_modules --exclude=build --exclude=target'
let g:fzf_action = { 'space': 'tab split' }
let g:fzf_buffers_jump = 1

nnoremap <silent> <leader>' :Files<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>. :Ag!<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "neovim"

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
