local list = {
    function(server, bufnr)
        local map = util.map
        local function hover()
            if not require 'ufo'.peekFoldedLinesUnderCursor() then
                vim.cmd [[Lspsaga hover_doc]]
            end
        end

        local set = util.map_opt_with_desc
        set {
            mode = 'n',
            opts = { buffer = bufnr },
            map = {
                { '<C-k>',      hover,                                      ' hover' },
                { 'gh',         hover,                                      ' hover' },
                { '<Leader>dc', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', ' 查看光标处诊断信息' },
                { '<Leader>dj', '<Cmd>Lspsaga diagnostic_jump_prev<CR>',    ' 跳转到上一个诊断信息处' },
                { '<Leader>dl', '<Cmd>Lspsaga diagnostic_jump_next<CR>',    ' 跳转到下一个诊断信息处' },
                { '<Leader>dm', '<Cmd>Lspsaga show_buf_diagnostics<CR>',    '  打开诊断列表' },
                {
                    '<Leader>dd',
                    '<Cmd>Lspsaga show_line_diagnostics<CR> ',
                    ' check out line diagnostic'
                },
                {
                    '<Leader>o',
                    '<Cmd>Lspsaga outline<CR>         ',
                    ' Show the variables window'
                },
                { 'gf', '<Cmd>Lspsaga lsp_finder<cr>      ', ' Lspsaga Finder' },
                { 'gd', '<Cmd>Lspsaga peek_definition<cr> ', ' peek definition' },
                { 'gD', '<Cmd>Lspsaga goto_definition<CR> ', ' jump to definition' },
                { 'gi', '<Cmd>Lspsaga incoming_calls<CR>  ', ' incoming invoke' },
                { 'go', '<Cmd>Lspsaga outgoing_calls<CR>  ', ' outgoing invoke' },
            },
        }

        local capabilities = server.server_capabilities
        if capabilities.codeActionProvider then
            map { '<Leader>ca', '<Cmd>Lspsaga code_action<CR>', desc = ' Code Action', buffer = bufnr }
        end

        if capabilities.definitionProvider then
            map { 'gd', '<Cmd>Lspsaga peek_definition<CR>', buffer = bufnr, desc = ' peek definition' }
            map { 'gD', '<Cmd>Lspsaga preview_definition<CR>', buffer = bufnr, desc = ' jump to definition' }
        end

        if capabilities.renameProvider then
            -- map { '<Leader>rn', '<Cmd>Lspsaga rename ++project<CR>', buffer = bufnr, desc = '凜 Rename' }
            map { '<Leader>rn', '<Cmd>Lspsaga rename<CR>', buffer = bufnr, desc = '凜 Rename' }
        end

        if server.server_capabilities.documentFormattingProvider then
            map { '==', function() vim.lsp.buf.format { async = true, buffer = bufnr } end, desc = ' formatting buffer' }
        end
        -- textDocument/prepareCallHierarchy
        -- vim.print(server.server_capabilities)
        -- if server.server_capabilities.textDocument.prepareCallHierarchy then
        -- end
    end,
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
        return require 'cmp_nvim_lsp'.default_capabilities(capabilities)
    end,
}
