local icon = require("util").icon


-- TODO : lsp server Name
local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

local function lsp_is_active()
    return vim.lsp.get_active_clients() ~= nil
end

local function get_lsp_staus()
    local clients = vim.lsp.get_active_clients()
    local status = ''
    local tmp = {}
    for _, v in pairs(clients) do
        table.insert(tmp, v.name)
    end
    status = table.concat(tmp, '  ')
    return status
end

local lsp_status = {
    get_lsp_staus,
    cond = lsp_is_active,
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
            -- "branch",
            { 'b:gitsigns_head', icon = '' },
            { 'diff', source = diff_source },
        },
    },
    winbar = {
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
                "os.date[[%A %H:%M]]",
                color = {
                    fg = '#000000', bg = '#10B981'
                },
            },
        },
    },
    -- extensions = { "nvim-tree" },
})
