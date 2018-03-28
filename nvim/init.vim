let g:dotfilesPath  = '~/dotfiles/nvim/config/'
let g:vimrcInit = g:dotfilesPath . 'init.vimrc'
let g:vimrcPlugins = g:dotfilesPath . 'plugins.vimrc'
let g:vimrcSpacing = g:dotfilesPath . 'spacing.vimrc'
let g:vimrcSyntax = g:dotfilesPath . 'syntax.vimrc'
let g:vimrcMovement = g:dotfilesPath . 'movement.vimrc'

exe 'source ' g:vimrcInit
exe 'source ' g:vimrcPlugins
exe 'source ' g:vimrcSpacing
exe 'source ' g:vimrcSyntax
exe 'source ' g:vimrcMovement
