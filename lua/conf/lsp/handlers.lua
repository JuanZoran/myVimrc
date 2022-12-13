local M = {}
local icon = require("util").icon

M.setup = function()
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
end

local navic = require("nvim-navic")
navic.setup({
    icon = icon.code_icon,
    highlight = true,
    separator = "  ",
})


---@format disable
M.on_attach = function(client, bufnr)

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
    local map = require("util").map
    map(
        "n",
        { silent = true, buffer = bufnr },
        { "<Leader>rn", "<cmd>Lspsaga rename<CR>",                  { desc = '凜 Rename'                   }},
        { "<Leader>ca", "<cmd>Lspsaga code_action<CR>",             { desc = ' Code Action'               }},

        -- NOTE:for text diagnostic
        { "<Leader>dd", "<cmd>Lspsaga show_line_diagnostics<CR>",   { desc = ' check out line diagnostic' }},
        { "<Leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = ' 查看光标处诊断信息'        }},
        { "<Leader>dj", "<cmd>Lspsaga diagnostic_jump_prev<cr>",    { desc = ' 跳转到上一个诊断信息处'    }},
        { "<Leader>dl", "<cmd>Lspsaga diagnostic_jump_next<cr>",    { desc = ' 跳转到下一个诊断信息处'    }},
        { "<Leader>de", vim.diagnostic.open_float,                  { desc = ' 查看详细诊断信息'          }},
        { "<Leader>dm", vim.diagnostic.setqflist,                   { desc = ' 打开诊断列表'              }},
        { "<Leader>o", "<cmd>LSoutlineToggle<CR>",                  { desc = ' Show the variables window' }},

        { "gh", "<cmd>Lspsaga hover_doc<cr>",                       { desc = ' 查看悬浮文档'              }},
        { "gf", "<cmd>Lspsaga lsp_finder<cr>",                      { desc = ' 查看相关信息'              }},
        { "gd", "<cmd>Lspsaga peek_definition<cr>",                 { desc = ' 查看定义'                  }},
        { "gD", vim.lsp.buf.declaration,                            { desc = ' 查看声明'                  }},
        { "gi", vim.lsp.buf.implementation,                         { desc = ' 查看实现'                  }},
        { "gr", vim.lsp.buf.references,                             { desc = ' 查看所有引用'              }},
        {
            "==",
            function()
                vim.lsp.buf.format({ async = true, })
            end,
            { desc = ' formatting buffer' },
        }
    )
end
---@format enable

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    vim.notify('cmp_nvim_lsp error', 'Error')
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- NOTE: Make UFO use Lsp for fold
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
capabilities.textDocument.publishDiagnostics.codeActionsInline = true


M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
return M
