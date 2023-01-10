local M = {}
local icon = require("util").icon

local signs = {
    { name = "DiagnosticSignError", text = icon.Error },
    { name = "DiagnosticSignWarn", text = icon.Warn },
    { name = "DiagnosticSignHint", text = icon.Hint },
    { name = "DiagnosticSignInfo", text = icon.Info },
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end


local config = {
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
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        -- prefix = "🔔",
        prefix = icon.LSPFloat,
    },
}

vim.diagnostic.config(config)

---@format disable
M.on_attach = function(_, bufnr)
    -- NOTE Keymap
    local set = require("util.map").set
    set {
        mode = "n",
        opt = { silent = true, buffer = bufnr },
        map = {
            { "<Leader>rn", "<cmd>Lspsaga rename<CR>",                  '凜 Rename'     },
            { "<Leader>ca", "<cmd>Lspsaga code_action<CR>",             ' Code Action' },
            -- NOTE :for text diagnostic
            { "<Leader>dd", "<cmd>Lspsaga show_line_diagnostics<CR>",   ' check out line diagnostic'   },
            { "<Leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", ' 查看光标处诊断信息'          },
            { "<Leader>dj", "<cmd>Lspsaga diagnostic_jump_prev<cr>",    ' 跳转到上一个诊断信息处'      },
            { "<Leader>dl", "<cmd>Lspsaga diagnostic_jump_next<cr>",    ' 跳转到下一个诊断信息处'      },
            { "<Leader>de", vim.diagnostic.open_float,                  ' 查看详细诊断信息'            },
            { "<Leader>dm", vim.diagnostic.setqflist,                   ' 打开诊断列表'                },
            { "<Leader>o", "<cmd>Lspsaga outline<CR>",                  ' Show the variables window'   },

            { "gf", "<cmd>Lspsaga lsp_finder<cr>",                      ' 查看相关信息' },
            { "gd", "<cmd>Lspsaga peek_definition<cr>",                 ' 查看定义'     },
            { "gD", vim.lsp.buf.declaration,                            ' 查看声明'     },
            { "gi", vim.lsp.buf.implementation,                         ' 查看实现'     },
            { "gr", vim.lsp.buf.references,                             ' 查看所有引用' },


            {
                "gh",
                function ()
                    local winid = require('ufo').peekFoldedLinesUnderCursor()
                    if not winid then
                        -- choose one of coc.nvim and nvim lsp
                        vim.cmd [[Lspsaga hover_doc]]
                    end
                end,
                ' 查看悬浮文档',
            },
            {
                "==",
                function()
                    vim.lsp.buf.format({ async = true, })
                end,
                ' formatting buffer' ,
            }
        }
    }
    -- TODO mapping for edit lsp config
    -- vim.keymap('n', '<leader><leader>l', function ()
    --     vim.cmd ('e %s'):format()
    -- end)
end
---@format enable

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- NOTE : Make UFO use Lsp for fold
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

-- NOTE  cmp config
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
        vim.notify('cmp_nvim_lsp error', 'Error')
        return
end
capabilities.textDocument.publishDiagnostics.codeActionsInline = true

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
