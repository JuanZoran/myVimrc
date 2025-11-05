-- local function memory_use()
--     local use = (1 - (vim.loop.get_free_memory() / vim.loop.get_total_memory())) * 100
--     return (' Memory: %.2f'):format(use) .. ' %%'
-- end

local function opts()
    return {
        options = {
            component_separators = { left = '', right = '' },
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
                    'Trouble',
                    'toggleterm',
                },
            },
        },
        extensions = { 'trouble', 'lazy', 'neo-tree' },
    }
end


return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = opts,
}
