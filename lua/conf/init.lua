require("conf.filetype")
-- NOTE: UI
require("conf.which-key")
require("conf.comment")

-- NOTE: LSP
require("conf.lsp-config")
require("conf.lsp.lspsaga")
require("conf.lsp")
require("conf/illuminate")
-- NOTE: Treesitter
require("conf.treesitter")
require("conf.gitsigns")
-- require("conf.treehop")

if not (vim.g.started_by_firenvim) then
    require("conf.notify")
    -- require("conf.nvim_tree")
    require("conf.bufferline")
    require("conf.lualine")
    require("conf.noice")
-- NOTE: Tools
    require("conf.telescope")
    require("conf.todo-comments")
end

-- TODO: Debugger
