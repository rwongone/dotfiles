let g:luaPath = g:dotfilesPath . 'lua/'
let g:lspConfigLua = g:luaPath. 'lsp_config.lua'

exe 'source ' . g:lspConfigLua
