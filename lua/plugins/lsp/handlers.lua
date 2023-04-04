local list = {
    function(server, bufnr)
        local map = util.map
        local function hover()
            if not require 'ufo'.peekFoldedLinesUnderCursor() then
                vim.cmd [[Lspsaga hover_doc]]
            end
        end

        map {
            { '<C-k>',      hover,                                      buffer = bufnr, desc = ' hover' },
            { 'gh',         hover,                                      buffer = bufnr, desc = ' hover' },
            { '<Leader>dc', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', buffer = bufnr, desc = ' 查看光标处诊断信息' },
            { '<Leader>dj', '<Cmd>Lspsaga diagnostic_jump_prev<CR>',    buffer = bufnr, desc = ' 跳转到上一个诊断信息处' },
            { '<Leader>dl', '<Cmd>Lspsaga diagnostic_jump_next<CR>',    buffer = bufnr, desc = ' 跳转到下一个诊断信息处' },
            { '<Leader>dm', '<Cmd>Lspsaga show_buf_diagnostics<CR>',    buffer = bufnr, desc = '  打开诊断列表' },
            {
                '<Leader>dd',
                '<Cmd>Lspsaga show_line_diagnostics<CR> ',
                buffer = bufnr,
                desc =
                ' check out line diagnostic'
            },
            {
                '<Leader>o',
                '<Cmd>Lspsaga outline<CR>         ',
                buffer = bufnr,
                desc =
                ' Show the variables window'
            },
            { 'gf', '<Cmd>Lspsaga lsp_finder<cr>      ', buffer = bufnr, desc = ' Lspsaga Finder' },
            { 'gd', '<Cmd>Lspsaga peek_definition<cr> ', buffer = bufnr, desc = ' peek definition' },
            { 'gD', '<Cmd>Lspsaga goto_definition<CR> ', buffer = bufnr, desc = ' jump to definition' },
            { 'gi', '<Cmd>Lspsaga incoming_calls<CR>  ', buffer = bufnr, desc = ' incoming invoke' },
            { 'go', '<Cmd>Lspsaga outgoing_calls<CR>  ', buffer = bufnr, desc = ' outgoing invoke' },
        }


        local capabilities = server.server_capabilities
        if capabilities.codeActionProvider then
            map { '<Leader>ca', '<Cmd>Lspsaga code_action<CR>', desc = ' Code Action' }
        end

        if capabilities.definitionProvider then
            map { 'gd', '<Cmd>Lspsaga peek_definition<CR>', desc = ' peek definition' }
            map { 'gD', '<Cmd>Lspsaga preview_definition<CR>', desc = ' jump to definition' }
        end

        if capabilities.renameProvider then
            map { '<Leader>rn', '<Cmd>Lspsaga rename ++project<CR>', desc = '凜 Rename' }
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
