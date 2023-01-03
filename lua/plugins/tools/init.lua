local use = require("packer").use
-- NOTE : ====================== Tools =====================
use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[require 'plugins.tools.todo-comments']]
}


use {
    "folke/which-key.nvim",
    config = [[ require "plugins.tools.which-key" ]]
}


use {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "md" },
    run = vim.fn["mkdp#util#install"]
}


use {
    "nguyenvukhang/nvim-toggler",
    keys = {
        { "n", "<Leader>u" },
    },
    config = [[require'plugins.tools.toggle']]
}


use {
    'akinsho/toggleterm.nvim',
    keys = {
        { 'n', '<C-d>' },
        { 'n', '<C-g>' },
        { 'i', '<C-g>' },
    },
    config = [[require"plugins.tools.toggleterm"]],
}



-- NOTE : for align
vim.keymap.set(
    'x', '<leader>=', function()
    require 'align'.align_to_string(false, true, true)
end)

use {
    {
        'Vonr/align.nvim',
        module = 'align',
    },

    { -- powerful comment with gc<char> | gb<char> | <leader>a
        "numtostr/comment.nvim",
        config = [[require'plugins.tools.comment']],
    },
}


-- lazy-load translate plugin
use {
    "/home/zoran/project/Neovim/Trans",
    keys = {
        { 'v', 'mm' },
        { 'n', 'mm' },
    },
    run = 'bash ./install.sh',
    config = function()
        require("Trans").setup {}
        vim.keymap.set("v", "mm", '<Esc><Cmd>TranslateSelectWord<CR>', { desc = ' Translate' })
        vim.keymap.set("n", "mm", "<Cmd>TranslateCursorWord<CR>",      { desc = ' Translate' })
    end
}

use {
    "windwp/nvim-autopairs",
    event = 'InsertEnter',
    config = [[require "plugins.tools.autopairs"]]
}

-- Session
use {
    "olimorris/persisted.nvim",
    config = [[require 'plugins.tools.session']],
}

-- integrate with git
use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = [[require 'plugins.tools.gitsigns']]
}


use {
    'AckslD/nvim-trevJ.lua',
    keys = {
        { "n", "<leader>ff", },
    },
    config = function()
        local m = require('trevj')
        m.setup {}
        vim.keymap.set('n', '<leader>ff', m.format_at_cursor, { desc = '[]Open Format At Cursor' })
    end, -- optional call for configurating non-default filetypes etc
}

-- focues mode
use {
    "folke/twilight.nvim",
    keys = {
        { 'n', '<leader><leader>h' }
    },
    config = [[require 'plugins.tools.zen']]
}


use {
    "ggandor/leap.nvim",
    config = require("leap").add_default_mappings,
}


-- | firenvim
use {
    "glacambre/firenvim",
    run = function()
        vim.fn["firenvim#install"](0)
    end,
}

-- use {
--     'rhysd/vim-grammarous',
-- }

-- use {
--     "mfussenegger/nvim-treehopper",
--     keys = {
--         { 'x', 'm' },
--         { 'o', 'm' },
--     },
--     config = function()
--         vim.keymap.set("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
--         vim.keymap.set("x", "m", ":lua require('tsht').nodes()<CR>", { silent = true })
--     end
-- }

-- use {
--     'edluffy/hologram.nvim',
--     fd = { 'md', 'markdown' },
--     config = function()
--         require('hologram').setup {
--             auto_display = true -- WIP automatic markdown image display, may be prone to breaking
--         }
--     end
-- }
