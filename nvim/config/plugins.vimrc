call plug#begin()
Plug 'github/copilot.vim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Vimjas/vim-python-pep8-indent',  { 'for': 'python' }
Plug 'janko/vim-test'
Plug 'KKPMW/vim-sendtowindow'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
call plug#end()

let g:jsx_ext_required = 0
let delimitMate_expand_cr = 1

" fzf
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

" vim-test
nnoremap <silent> tn :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
nnoremap <silent> ts :TestSuite<CR>
nnoremap <silent> tl :TestLast<CR>
nnoremap <silent> tg :TestVisit<CR>
let test#strategy = "neovim"
let test#ruby#use_binstubs = 0

" open-browser-github

nnoremap <silent> <leader>gp :OpenGithubProject<CR>
nnoremap <silent> <leader>gf :OpenGithubFile<CR>
vnoremap <silent> <leader>gf :OpenGithubFile<CR>
