require("sniprun").setup {
    -- selected_interpreters = {}, --# use those instead of the default for the current filetype
    -- repl_enable = {}, --# enable REPL-like behavior for the given interpreters
    -- repl_disable = {}, --# disable REPL-like behavior for the given interpreters
    --
    -- interpreter_options = { --# interpreter-specific options, see docs / :SnipInfo <name>
    --     --# use the interpreter name as key
    --     GFM_original = {
    --         use_on_filetypes = { "markdown.pandoc" } --# the 'use_on_filetypes' configuration key is
    --         --# available for every interpreter
    --     },
    --     Python3_original = {
    --         error_truncate = "auto" --# Truncate runtime errors 'long', 'short' or 'auto'
    --         --# the hint is available for every interpreter
    --         --# but may not be always respected
    --     }
    -- },
    --
    -- --# you can combo different display modes as desired and with the 'Ok' or 'Err' suffix
    -- --# to filter only sucessful runs (or errored-out runs respectively)
    display = {
        --     "Classic", --# display results in the command-line  area
        -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

        "VirtualText", --# display results as virtual text
            -- "TempFloatingWindow",      --# display results in a floating window
        --     -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
            -- "Terminal",                --# display results in a vertical split
        --     -- "TerminalWithCode",        --# display results and code history in a vertical split
        --     -- "NvimNotify",              --# display with the nvim-notify plugin
        --     -- "Api"                      --# return output to a programming interface
    },
    --
    -- live_display = { "VirtualTextOk" }, --# display mode used in live_mode
    --
    -- display_options = {
    --     terminal_width = 45, --# change the terminal display option width
    --     notification_timeout = 5 --# timeout for nvim_notify output
    -- },
    --
    -- --# You can use the same keys to customize whether a sniprun producing
    -- --# no output should display nothing or '(no output)'
    -- show_no_output = {
    --     "Classic",
    --     "TempFloatingWindow", --# implies LongTempFloatingWindow, which has no effect on its own
    -- },
    --
    -- --# customize highlight groups (setting this overrides colorscheme)
    snipruncolors = {
        -- SniprunVirtualTextOk  = { bg = "#", fg = "#000000" },
        -- SniprunVirtualTextOk  = { fg = "#599eff" },
        SniprunVirtualTextOk  = { bg = "#89e051", fg = '#1d202f' },
        SniprunFloatingWinOk  = { fg = "#599eff" },
        SniprunVirtualTextErr = { bg = "#881515", fg = "#000000", ctermbg = "DarkRed", cterfg = "Black" },
        SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" },
    },

    -- live_mode_toggle = 'off', --# live mode toggle, see Usage - Running for more info

    -- --# miscellaneous compatibility/adjustement settings
    -- inline_messages = 0, --# inline_message (0/1) is a one-line way to display messages

    -- --# to workaround sniprun not being able to display anything

    borders = 'rounded', --# display borders around floating windows
    -- --# possible values are 'none', 'single', 'double', or 'shadow'
}
vim.keymap.set('n', '<leader><C-r>', '<Cmd>SnipRun<CR>', {
    desc = '💪Execute Snippet'
})

vim.keymap.set('v', '<C-r>', '<Esc><Cmd>SnipRun<CR>', {
    desc = '💪Execute Snippet'
})

