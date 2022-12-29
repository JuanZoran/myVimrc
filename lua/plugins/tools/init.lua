local use = require("packer").use
-- NOTE: ====================== Tools =====================
use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
}


use {
    "folke/which-key.nvim",
    config = [[ require "plugins.tools.which-key" ]]
}


-- markdown preview
use {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "md" },
    run = function()
        vim.fn["mkdp#util#install"]()
    end,
}


use {
    "nguyenvukhang/nvim-toggler",
    keys = {
        { "n", "<Leader>u" },
    },
    config = [[require'plugins.tools.toggle']]
}

use {
    "numtostr/comment.nvim",
    config = [[require'plugins.tools.comment']]
} -- powerful comment with gc<char> | gb<char> | <leader>a
use("nvim-treesitter/nvim-treesitter-textobjects") -- easymotion with text
use {
    'akinsho/toggleterm.nvim',
    keys = {
        { 'n', '<C-d>' },
        { 'n', '<C-g>' },
        { 'i', '<C-g>' },
    },
    config = [[require"plugins.tools.toggleterm"]],
}


-- TODO: read official readme for better use this powerful align helper: this can help markdown auto-align with table
use {
    "junegunn/vim-easy-align",
    keys = {
        { '', '<Leader>=' },
    },
    config = function()
        vim.keymap.set('', '<leader>=', '<Plug>(EasyAlign)', { desc = 'ﱓ EasyAlign' })
    end,
}

-- lazy-load translate plugin
use {
    "/home/zoran/project/neovim/Trans",
    keys = {
        { 'v', 'mm' },
        { 'n', 'mm' },
    },
    run = 'bash ./install.sh',
    config = function()
        require("Trans").setup {}
        vim.keymap.set("v", "mm", '<Esc><Cmd>TranslateSelectWord<CR>', { desc = ' Translate' })
        vim.keymap.set("n", "mm", "<Cmd>TranslateCursorWord<CR>", { desc = ' Translate' })
    end
}


use {
    "windwp/nvim-autopairs",
    event = 'InsertEnter',
    config = 'require("conf.autopairs")'
}

-- use {
--     'rhysd/vim-grammarous',
-- }



-- integrate with git
use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
}


use {
    'AckslD/nvim-trevJ.lua',
    keys = { {
        "n",
        "<leader>ff",
    } },
    config = function()
        local m = require('trevj')
        m.setup {}
        vim.keymap.set('n', '<leader>ff', m.format_at_cursor, { desc = '[]Open Format At Cursor' })
    end, -- optional call for configurating non-default filetypes etc
}


use { -- foucs mode
    'junegunn/limelight.vim',
    keys = { 'n', '<leader><leader>h' },
    config = 'require("conf.zen")'
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
