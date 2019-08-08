let g:dotfilesPath  = '~/dotfiles/nvim/config/'
let g:vimrcInit = g:dotfilesPath . 'init.vimrc'
let g:vimrcPlugins = g:dotfilesPath . 'plugins.vimrc'
let g:vimrcSpacing = g:dotfilesPath . 'spacing.vimrc'
let g:vimrcSyntax = g:dotfilesPath . 'syntax.vimrc'
let g:vimrcMovement = g:dotfilesPath . 'movement.vimrc'
let g:vimrcClipboard = g:dotfilesPath . 'clipboard.vimrc'
let g:vimrcTerminal = g:dotfilesPath . 'terminal.vimrc'

exe 'source ' g:vimrcInit
exe 'source ' g:vimrcPlugins
exe 'source ' g:vimrcSpacing
exe 'source ' g:vimrcSyntax
exe 'source ' g:vimrcMovement
exe 'source ' g:vimrcClipboard
exe 'source ' g:vimrcTerminal
