require("configs/notify-conf")
-- require("functions")
-- =============== Plugin ================
require'impatient'

require("configs/alpha")
require("configs/comment-conf")
require("configs/explorer-conf")
require("configs/filetype-conf")

require("configs/cmp-conf")
require("configs/lsp-conf")
require("configs/nscroll-conf")
require("configs/scrollbar-conf")
require("configs/ts-conf")
require("configs/navic-conf")

-- TODO: I don't know how to config this now 
require("configs/wilder-conf")
require("lualine").setup{
options = { theme = 'dracula' }
}

require("configs/autopair-conf")

require("configs/bufferline")
require("configs/telescope-conf")
