if vim.g.vscode then
    -- VSCode extension
  require("rwong.vscode")
else
    -- ordinary Neovim
  require("rwong.core")
  require("rwong.lazy")
end


