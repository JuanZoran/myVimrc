require('dracula').setup {

    transparent_bg = true, -- default false

    -- lualine_bg_color = "#44475a", -- default nil

    italic_comment = true, -- default false

    overrides = require('plugins.ui.theme.override')
}

vim.cmd[[colorscheme dracula]]
