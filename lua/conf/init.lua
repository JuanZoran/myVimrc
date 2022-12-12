require("conf.filetype")
-- NOTE: UI
require("conf.smooth")
require("conf.which-key")
require("conf.comment")
require("conf.hop")

-- NOTE: LSP
require("conf.lsp-config")
require("conf.lsp.lspsaga")
require("conf.lsp")
require("conf/illuminate")
-- NOTE: Treesitter
require("conf.treesitter")
require("conf.autopairs")
require("conf.gitsigns")
require("conf.treehop")

if not (vim.g.started_by_firenvim) then
    require("conf.alpha")
    require("conf.notify")
    -- require("conf.nvim_tree")
    require("conf.bufferline")
    require("conf.lualine")
    require("conf.noice")
-- NOTE: Tools
    require("conf.telescope")
    require("conf.auto-session")
    require("conf.session-lens")
    require("conf.todo-comments")
    require("conf.indent")
end

-- TODO: Debugger
