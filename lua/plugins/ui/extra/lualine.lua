local function memory_use()
    local use = (1 - (vim.loop.get_free_memory() / vim.loop.get_total_memory())) * 100
    return (' Memory: %.2f'):format(use) .. ' %%'
end

local function opts()
    local winbar = {
        lualine_a = {
            function() return '盛 ' .. os.date '%A %H:%M' end,
        },
        lualine_b = {
            { 'fancy_diagnostics' },
            {
                require 'noice'.api.status.mode.get,
                cond = require 'noice'.api.status.mode.has,
                color = { fg = '#ff9e64' },
            },
        },
        lualine_c = {
            {
                function() return require 'nvim-navic'.get_location() end, -- FIXME : why it is not working
                cond = require 'nvim-navic'.is_available,
            },
        },
        lualine_y = {
            memory_use,
        },
        lualine_z = {
            {
                'fancy_lsp_servers',
                color = {
                    fg = '#000000',
                    bg = '#986FEC'
                    -- fg = '#000000', bg = '#e27d60'
                },
            },
        },
    }

    local sections = {
        lualine_a = {
            { 'fancy_mode', width = 6 },
        },
        lualine_b = {
            { 'b:gitsigns_head', icon = ' ' },
            { 'fancy_diff' },
        },
        lualine_c = {
            { 'fancy_cwd', substitute_home = true },
        },
    }

    return {
        options = {
            -- component_separators = { left = '', right = '' },
            theme = 'auto',
            section_separators = {
                right = '',
                left = '',
            },
            globalstatus = true,
            disabled_filetypes = {
                statusline = {
                    'alpha',
                    'toggleterm',
                    'lspsagaoutline',
                },
                winbar = {
                    'alpha',
                    'help',
                    'lspsagaoutline',
                    'Trouble',
                    'toggleterm',
                    'dap-repl',
                    'dapui_console',
                    'dapui_watches',
                    'dapui_stacks',
                    'dapui_breakpoints',
                    'dapui_scopes',
                },
            },
        },
        sections = sections,
        winbar = winbar,
        extensions = { 'trouble', 'lazy', 'neo-tree' },
    }
end


return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
        'meuter/lualine-so-fancy.nvim',
        {
            'SmiteshP/nvim-navic',
            lazy = true,
            opts = {
                highlight = true,
                separator = ' >> ',
                depth_limit = 5,
            },
            init = function()
                -- vim.g.navic_silence = true
                require 'plugins.lsp.handlers'.attach(function(client, bufnr)
                    if client.server_capabilities.documentSymbolProvider then
                        require 'nvim-navic'.attach(client, bufnr)
                    end
                end)
            end,
        },
    },
    opts = opts,
}
