local plugins = util.list()
plugins:add {
    import = 'plugins.lang.extra',
}

plugins:add {
    'L3mon4d3/luasnip',
    lazy = true,
    build = 'make install_jsregexp',
    keys = {
        { mode = 'x', '<C-x>', [["ec<cmd>lua require('luasnip.extras.otf').on_the_fly()<cr>]] },
        { mode = 'i', '<C-x>', [[<cmd>lua require('luasnip.extras.otf').on_the_fly("e")<cr>]] },
    },
    config = function() require 'plugins.lang.opts.luasnip' end,
    dependencies = {
        { 'rafamadriz/friendly-snippets', cond = false },
        { 'JuanZoran/snippet_lua',        dev = true },
    },
}

plugins:add {
    'danymat/neogen',
    keys = {
        { '<leader>gg', '<Cmd>Neogen<Cr>', desc = 'Generate Snippet' },
    },
    opts = {
        snippet_engine = 'luasnip',
    },
}

plugins:add {
    'folke/trouble.nvim',
    keys = {
        { '<leader>df', '<Cmd>TroubleToggle <CR>', desc = 'Toggle QuickFix' },
    },
    opts = {
        action_keys = {
            -- key mappings for actions in the trouble list
            close = 'q',                         -- close the list
            cancel = '<Esc>',                    -- cancel the preview and get back to your last window / buffer / cursor
            refresh = 'r',                       -- manually refresh
            jump = { '<cr>', '<tab>', '<C-o>' }, -- jump to the diagnostic or open / close folds
            open_split = 'do',                   -- open buffer in new split
            open_vsplit = 'du',                  -- open buffer in new vsplit
            open_tab = 'dk',                     -- open buffer in new tab
            jump_close = 'o',                    -- jump to the diagnostic and close the list
            toggle_mode = 'm',                   -- toggle between "workspace" and "document" diagnostics mode
            toggle_preview = 'P',                -- toggle auto_preview
            hover = 'gh',                        -- opens a small popup with the full multiline message
            preview = 'p',                       -- preview the diagnostic location
            close_folds = { 'zM', 'zm' },        -- close all folds
            open_folds = { 'zR', 'zr' },         -- open all folds
            toggle_fold = 'za',                  -- toggle fold of current file
            previous = 'i',                      -- previous item
            next = 'k',                          -- next item
        },
    },
}


plugins:add {
    'michaelb/sniprun',
    build = 'bash ./install.sh',
    keys = {
        { '<leader><C-r>', '<Cmd>SnipRun<CR>', desc = '💪Execute Snippet' },
        { '<C-r>',         mode = 'x',         '<Esc><Cmd>SnipRun<CR>',     desc = '💪Execute Snippet' },
    },
    opts = {
        display = {
            'TempFloatingWindow',     --# display results in a floating window
            'LongTempFloatingWindow', --# same as above, but only long results. To use with VirtualText[Ok/Err]
        },
        snipruncolors = {
            SniprunVirtualTextOk  = { bg = '#89e051', fg = '#1d202f' },
            SniprunFloatingWinOk  = { fg = '#599eff' },
            SniprunVirtualTextErr = { bg = '#881515', fg = '#000000', ctermbg = 'DarkRed', cterfg = 'Black' },
            SniprunFloatingWinErr = { fg = '#881515', ctermfg = 'DarkRed' },
        },
        borders = 'rounded',
    }, --# display borders around floating windows
}

---@format disable-next
plugins:add {
    'ThePrimeagen/refactoring.nvim',
    keys = { {
        mode = 'x', '<Leader>rr',
        function() require 'telescope'.extensions.refactoring.refactors() end,
        desc = '🎈Refactoring Operations'
    }, },
    config = function()
        require 'refactoring'.setup()
        require 'telescope'.load_extension 'refactoring'
    end,
}

local frontend = { 'html', 'css' }
plugins:add {
    'windwp/nvim-ts-autotag',
    config = function(plugin)
        require 'nvim-ts-autotag'.setup {
            filetypes = plugin.ft,
        }
    end,
    ft = frontend,
}

plugins:add {
    'ray-x/web-tools.nvim',
    cmd = 'BrowserPreview',
    config = true,
    dependencies = {
        'https://git.sr.ht/~nedia/auto-save.nvim',
        ft = frontend,
        opts = {
            save_fn = function()
                if vim.tbl_contains(frontend, vim.bo.filetype) then
                    vim.cmd [[w]]
                end
            end,
        },
    },
}
return plugins
