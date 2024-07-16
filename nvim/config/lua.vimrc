let g:luaPath = g:dotfilesPath . 'lua/'
let g:lspConfigLua = g:luaPath. 'lsp_config.lua'
let g:telescopeLua = g:luaPath. 'telescope.lua'

exe 'source ' . g:lspConfigLua
exe 'source ' . g:telescopeLua
