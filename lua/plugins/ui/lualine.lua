-- TODO : lsp server Name
local function diff_source()
    ---@diagnostic disable-next-line: undefined-field
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

local function get_lsp_staus()
    local clients = vim.lsp.get_active_clients()
    local tmp = {}
    for i, v in pairs(clients) do
        tmp[i] = v.name
    end

    local status = table.concat(tmp, '  ')

    return (({
        ['c']      = 'ﭰ',
        ['c++']    = 'ﭱ',
        ['go']     = 'ﳑ',
        ['python'] = ' ',
        ['html']   = ' ',
        ['lua']    = ' ',
        ['sh']     = ' ',
    })[vim.bo.filetype] or '') .. status
end

local function memory_use()
    local use = (1 - (vim.loop.get_free_memory() / vim.loop.get_total_memory())) * 100
    return ' Memory: ' .. ('%.2f'):format(use) --[[  .. '%' ]]
end

local lsp_status = {
    get_lsp_staus,
    cond = function()
        return vim.lsp.get_active_clients() ~= nil
    end,
    color = {
        fg = '#000000', bg = '#10B981'
    },
    separator = {
        left = '',
        right = '',
    }, -- Determines what separator to use for the component.
}


require("lualine").setup({
    options = {
        -- component_separators = { left = '', right = '' },
        section_separators = {
            right = '',
            left = '',
        },
        theme = "auto",
        disabled_filetypes = {
            statusline = {
                "alpha",
                -- "NvimTree",
                "startuptime",
                "toggleterm",
                "lspsagaoutline",
            },
            winbar = {
                "alpha",
                "help",
                "packer",
                "NvimTree",
                "lspsagaoutline",
                "toggleterm",
                -- "dap-repl",
                -- "dapui_console",
                -- "dapui_watches",
                -- "dapui_stacks",
                -- "dapui_breakpoints",
                -- "dapui_scopes",
            },
        },
    },
    sections = {
        lualine_b = {
            { 'b:gitsigns_head', icon = ' ' },
            { 'diff', source = diff_source },
        },
    },
    winbar = {
        lualine_y = {
            {
                memory_use,
            },
        },
        lualine_z = {
            lsp_status,
        },

        lualine_c = {
            {
                function()
                    return require('lspsaga.symbolwinbar'):get_winbar()
                end
            }
        },
        lualine_a = {
            {
                function()
                    return '盛' .. os.date('%A %H:%M')
                end,
                color = {
                    fg = '#000000', bg = '#10B981'
                },
            },
        },
        lualine_b = {
            {
                require("noice").api.status.mode.get,
                cond = require("noice").api.status.mode.has,
                color = { fg = "#ff9e64" },
            },
        },
    },
    -- extensions = { "nvim-tree" },
})
