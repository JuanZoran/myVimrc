vim.diagnostic.config {
    update_in_insert = true,
    severity_sort = true,
    float = {
        style  = "minimal",
        border = "rounded",
    },
    virtual_text = {
        source = "always",
        prefix = ' ',
    },
    -- signs = {
    --     active = signs,
    -- },
    -- underline = true,
}


local list = {
    function(_, bufnr)
        -- vim.pretty_print(_)
        -- NOTE Keymap
        local set = require("util.map").set
        set {
            mode = "n",
            opt = { silent = true, buffer = bufnr },
            map = {
                { "<Leader>rn", "<Cmd>Lspsaga rename<CR>                ",  '凜 Rename' },
                { "<Leader>ca", "<Cmd>Lspsaga code_action<CR>           ",  ' Code Action' },
                { "<Leader>dd", "<Cmd>Lspsaga show_line_diagnostics<CR> ",  ' check out line diagnostic' },

                -- NOTE :for text diagnostic
                { "<Leader>dc", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", ' 查看光标处诊断信息' },
                { "<Leader>dj", "<Cmd>Lspsaga diagnostic_jump_prev<CR>",    ' 跳转到上一个诊断信息处' },
                { "<Leader>dl", "<Cmd>Lspsaga diagnostic_jump_next<CR>",    ' 跳转到下一个诊断信息处' },
                { "<Leader>dm", '<Cmd>Lspsaga show_buf_diagnostics<CR>',    '  打开诊断列表' },
                { "<Leader>o",  "<Cmd>Lspsaga outline<CR>         ",        ' Show the variables window' },
                { "gf",         "<Cmd>Lspsaga lsp_finder<cr>      ",        ' Lspsaga Finder' },
                { "gd",         "<Cmd>Lspsaga peek_definition<cr> ",        ' peek definition' },
                { "gD",         '<Cmd>Lspsaga goto_definition<CR> ',        ' jump to definition' },
                { "gi",         '<Cmd>Lspsaga incoming_calls<CR>  ',        ' incoming invoke' },
                { "gr",         '<Cmd>Lspsaga outgoing_calls<CR>  ',        ' outgoing invoke' },

                {
                    "gh",
                    function()
                        if not require('ufo').peekFoldedLinesUnderCursor() then
                            -- choose one of coc.nvim and nvim lsp
                            vim.cmd [[Lspsaga hover_doc]]
                        end
                    end,
                    ' hover',
                },

                {
                    "==",
                    function() vim.lsp.buf.format({ async = true, buffer = bufnr }) end,
                    ' formatting buffer',
                }
            }
        }
    end
}


return {
    ---add attach function
    ---@param func function
    attach = function(func)
        list[#list + 1] = func
    end,
    on_attach = function(client, bufnr)
        for _, process in ipairs(list) do
            process(client, bufnr)
        end
    end,
    get_capabilities = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.publishDiagnostics.codeActionsInline = true
        return require("cmp_nvim_lsp").default_capabilities(capabilities)
    end,
}
