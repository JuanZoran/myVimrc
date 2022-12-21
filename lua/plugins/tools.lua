local use = require("packer").use
-- NOTE: ====================== Tools =====================
use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
})


use("folke/which-key.nvim")


-- markdown preview
use({
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "md" },
    run = function()
        vim.fn["mkdp#util#install"]()
    end,
})


use {
    "nguyenvukhang/nvim-toggler",
    keys = {
        { "n", "<Leader>u" },
    },
    config = function()
        require("conf.toggle")
    end,
}

-- TODO: compare this with toggleterm
-- FIXME: use Lspsaga with this
-- use("voldikss/vim-floaterm") -- float terminal
use("numtostr/comment.nvim") -- powerful comment with gc<char> | gb<char> | <leader>a
use("nvim-treesitter/nvim-treesitter-textobjects") -- easymotion with text


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
use({
    "JuanZoran/Trans.nvim",
    keys = {
        { 'v', 'mm' },
        { 'n', 'mm' },
    },
    run = 'bash ./install.sh',
    config = function()
        require("Trans").setup{}
        vim.keymap.set("v", "mm", '<Esc><Cmd>TranslateSelectWord<CR>', { desc = ' Translate' })
        vim.keymap.set("n", "mm", "<Cmd>TranslateCursorWord<CR>", { desc = ' Translate' })
    end
})


use {
    "windwp/nvim-autopairs",
    event = 'InsertEnter',
    config = 'require("conf.autopairs")'
}



-- integrate with git
use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
})


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


use({
    "ggandor/leap.nvim",
    config = function()
        require("leap").add_default_mappings()
    end
})


-- | firenvim
use({
    "glacambre/firenvim",
    run = function()
        vim.fn["firenvim#install"](0)
    end,
})
