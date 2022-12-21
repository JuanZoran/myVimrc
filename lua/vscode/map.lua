require("maps.basic")
local set = require("util.map").map

set {
    mode = '',
    map = {
        { "i", "k" },
        { "k", "j" },
        { "j", "h" },
        { "I", "<C-u>" },
        { "K", "<C-d>" },
        { "J", "0" },
        { "L", "$" },
    }
}


set {
    mode = 'n',
    map = {
        --     -- INFO: about window
        { "wo", function() vim.fn.VSCodeNotify('workbench.action.splitEditorRight') end },
        { "wu", function() vim.fn.VSCodeNotify('workbench.action.splitEditorDown') end },
        { "wn", function() vim.fn.VSCodeNotify('workbench.action.closeEditorsInOtherGroups') end },

        { "wj", function() vim.fn.VSCodeNotify('workbench.action.navigateLeft') end },
        { "wl", function() vim.fn.VSCodeNotify('workbench.action.navigateRight') end },
        { "wi", function() vim.fn.VSCodeNotify('workbench.action.navigateUp') end },
        { "wk", function() vim.fn.VSCodeNotify('workbench.action.navigateDown') end },
        { "<leader>w", function()
            -- vim.fn.VSCodeCall('workbench.action.files.saveAll')
            -- vim.fn.VSCodeNotify('workbench.action.closeAllEditors')
            vim.fn.VSCodeNotify('workbench.action.closeActiveEditor')
        end },
        { "ww", function() vim.fn.VSCodeNotify('workbench.view.explorer') end },
        { '<leader>u', require('nvim-toggler').toggle, },
        -- TODO:config this
        --         { "w<Down>",  "<C-w>J",         { desc = ' 窗口向下移动'     }},
        --         { "w<Up>",    "<C-w>K",         { desc = ' 窗口向上移动'     }},
        --         { "w<Left>",  "<C-w>H",         { desc = ' 窗口向左移动'     }},
        --         { "w<Right>", "<C-w>L",         { desc = ' 窗口向右移动'     }},
        --         -- INFO: command
        --         { "qw",        "<cmd>close<CR>"    },
        --         { "qd",        "<cmd>bdelete!<CR>" },
        --         { "wd",       "<CMD>close<CR>", { desc = '[] 关闭当前窗口'    }},
    }
}
