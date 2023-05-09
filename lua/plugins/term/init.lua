local lazygit, ranger

local config = function(_, opts)
    require 'toggleterm'.setup(opts)
    local t = require 'toggleterm.terminal'.Terminal
    lazygit = t:new {
        cmd = 'lazygit',
        hidden = true,
    }

    ranger = t:new {
        cmd = 'ranger',
        hidden = true,
    }
end


local flatten = {
    'willothy/flatten.nvim',
    opts = {
        callbacks = {
            pre_open = function() -- Close toggleterm when an external open request is received
                require 'toggleterm'.toggle(0)
            end,
            post_open = function(bufnr, winnr, ft)
                if ft == 'gitcommit' then
                    -- If the file is a git commit, create one-shot autocmd to delete it on write
                    -- If you just want the toggleable terminal integration, ignore this bit and only use the
                    -- code in the else block
                    vim.api.nvim_create_autocmd('BufWritePost', {
                        buffer = bufnr,
                        once = true,
                        callback = function()
                            -- This is a bit of a hack, but if you run bufdelete immediately
                            -- the shell can occasionally freeze
                            vim.defer_fn(function() vim.api.nvim_buf_delete(bufnr, {}) end, 50)
                        end,
                    })
                    return
                end
                -- If it's a normal file, then reopen the terminal, then switch back to the newly opened window
                -- This gives the appearance of the window opening independently of the terminal
                require 'toggleterm'.toggle(0)
                vim.api.nvim_set_current_win(winnr)
            end,
            block_end = function()
                -- After blocking ends (for a git commit, etc), reopen the terminal
                require 'toggleterm'.toggle(0)
            end,
        },
    },
}



local toggleterm = {
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = {
        '<C-d>',
        { '<C-g>',     function() lazygit:toggle() end,            desc = 'Toggle Lazygit' },
        { '<leader>R', function() ranger:toggle() end,             desc = 'Toggle Lazygit' },
        { '<C-e>u',    '<Cmd>ToggleTerm direction=horizontal<CR>', desc = 'Toggle Terminal horizontal' },
        { '<C-e>o',    '<Cmd>ToggleTerm direction=vertical<CR>',   desc = 'Toggle Terminal vertical' },
        { '<C-e>i',    '<Cmd>ToggleTerm direction=float<CR>',      desc = 'Toggle Terminal float' },
        -- { '<C-e><C-e>', '<Cmd>ToggleTermSendCurrentLine<CR>',       desc = 'Send Current Line' },
    },
    opts = {
        size = function(term)
            return ({
                horizontal = vim.o.lines * 0.3,
                vertical   = vim.o.columns * 0.35,
            })[term.direction]
        end,
        open_mapping = '<C-d>',
        autochdir = true,
        direction = 'float', --[[ 'vertical' | 'horizontal' | 'tab' | 'float', ]]
        float_opts = {
            border = 'rounded',
        },
    },
    config = config,
}

return {
    flatten,
    toggleterm,
}
