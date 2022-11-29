require("nvim-autopairs").setup({
    check_ts = true,
    fast_wrap = {
        map = "<C-e>",
        chars = { "{", "[", "(", '"', "'" , "<" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "l",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
})

-- vim.cmd[[hi PmenuSel guifg=#1d202f guibg=#f7768e]]
vim.cmd[[hi PmenuSel cterm=bold gui=bold guifg=#1d202f guibg=#7aa2f7]]
-- If you want insert `(` after select function or method item
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    vim.notify('cmp error', 'error')
  return
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local handlers = require("nvim-autopairs.completion.handlers")

cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done({
        filetypes = {
            -- "*" is an alias to all filetypes
            ["*"] = {
                ["("] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method,
                    },
                    handler = handlers["*"],
                },
            },
            -- -- Disable for tex
            -- tex = false,
        },
    })
)
