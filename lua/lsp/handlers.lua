local icon = require("util").icon
local signs = {
    { name = "DiagnosticSignError", text = icon.Error },
    { name = "DiagnosticSignWarn", text = icon.Warn },
    { name = "DiagnosticSignHint", text = icon.Hint },
    { name = "DiagnosticSignInfo", text = icon.Info },
}

local def = vim.fn.sign_define
for _, sign in ipairs(signs) do
    def(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end


vim.diagnostic.config {
    -- virtual_text = true, --- enable for diagnostic information
    virtual_text = { source = "always", prefix = icon.VirtualText },
    -- show signs
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
        focusable = false,
        style     = "minimal",
        border    = "rounded",
        source    = "always ",
        header    = "",
        prefix    = "🔔",
    },
}

local M = {}
---@format disable
M.on_attach = function(_, bufnr)
    -- NOTE Keymap
    local set = require("util.map").set
    set {
        mode = "n",
        opt = { silent = true, buffer = bufnr },
        map = {
            { "<Leader>rn" , "<Cmd>Lspsaga rename<CR>                ",   '凜 Rename'               },
            { "<Leader>ca" , "<Cmd>Lspsaga code_action<CR>           ",   ' Code Action'               },
            { "<Leader>dd" , "<Cmd>Lspsaga show_line_diagnostics<CR> ",   ' check out line diagnostic' },

            -- NOTE :for text diagnostic
            { "<Leader>dc" , "<Cmd>Lspsaga show_cursor_diagnostics<CR>", ' 查看光标处诊断信息'     },
            { "<Leader>dj" , "<Cmd>Lspsaga diagnostic_jump_prev<CR>",    ' 跳转到上一个诊断信息处' },
            { "<Leader>dl" , "<Cmd>Lspsaga diagnostic_jump_next<CR>",    ' 跳转到下一个诊断信息处' },
            { "<Leader>dm" , '<Cmd>Lspsaga show_buf_diagnostics<CR>',    '  打开诊断列表' },
            { "<Leader>o"  , "<Cmd>Lspsaga outline<CR>         ", ' Show the variables window' },
            { "gf"         , "<Cmd>Lspsaga lsp_finder<cr>      ", ' Lspsaga Finder'            },
            { "gd"         , "<Cmd>Lspsaga peek_definition<cr> ", ' peek definition'           },
            { "gD"         , '<Cmd>Lspsaga goto_definition<CR> ', ' jump to definition'        },
            { "gi"         , '<Cmd>Lspsaga incoming_calls<CR>  ', ' incoming invoke'           },
            { "gr"         , '<Cmd>Lspsaga outgoing_calls<CR>  ', ' outgoing invoke'           },

            {
                "gh",
                function ()
                    if not require('ufo').peekFoldedLinesUnderCursor() then
                        -- choose one of coc.nvim and nvim lsp
                        vim.cmd [[Lspsaga hover_doc]]
                    end
                end,
                ' hover',
            },

            {
                "==",
                function() vim.lsp.buf.format({ async = true, buffer = bufnr}) end,
                ' formatting buffer' ,
            }
        }
    }
end
---@format enable

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- NOTE : Make UFO use Lsp for fold
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities.textDocument.publishDiagnostics.codeActionsInline = true

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
