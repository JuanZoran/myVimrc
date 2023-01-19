require("zen-mode").setup {
    window = {
        -- backdrop = 0.7,
        width = .85,
    },
    -- NOTE it doesn't work
    -- plugins = {
    --     kitty = {
    --         enable = true,
    --         font = '+10',
    --     },
    -- }
}

require("twilight").setup {
    context = 20,
}

vim.keymap.set('n', '<leader><leader>h', '<cmd>ZenMode<cr>')
-- NOTE limelight hl
-- vim.g.limelight_conceal_ctermfg = 'gray'
-- vim.g.limelight_conceal_guifg = 'DarkGray'
