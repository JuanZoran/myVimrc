local api, fn = vim.api, vim.fn

local keys = {
    {
        '<leader><leader>k',
        mode = { 'n', 'x', 'o' },
        function()
            require 'flash'.jump { pattern = fn.expand '<cword>' }
        end,
    },
    {
        'R',
        mode = 'o',
        function()
            local operator = vim.v.operator
            local register = vim.v.register
            api.nvim_feedkeys(vim.keycode '<esc>', 'o', true)
            vim.schedule(function()
                require 'flash'.jump {
                    action = function(match, state)
                        local op_func = vim.go.operatorfunc
                        local saved_view = fn.winsaveview()
                        api.nvim_set_current_win(match.win)
                        api.nvim_win_set_cursor(match.win, match.pos)
                        _G.flash_op = function()
                            local start = api.nvim_buf_get_mark(0, '[')
                            local finish = api.nvim_buf_get_mark(0, ']')
                            api.nvim_cmd({ cmd = 'normal', bang = true, args = { 'v' } }, {})
                            api.nvim_win_set_cursor(0, { start[1], start[2] })
                            vim.cmd 'normal! o'
                            api.nvim_win_set_cursor(0, { finish[1], finish[2] })
                            vim.go.operatorfunc = op_func
                            api.nvim_input('"' .. register .. operator)

                            vim.schedule(function()
                                api.nvim_set_current_win(state.win)
                                fn.winrestview(saved_view)
                            end)

                            _G.flash_op = nil
                        end
                        vim.go.operatorfunc = 'v:lua.flash_op'
                        api.nvim_feedkeys('g@', 'n', false)
                    end,
                }
            end)
        end,
    },
    {
        '<leader>j',
        mode = { 'n', 'x', 'o' },
        function()
            require 'flash'.jump {
                search = { forward = false, wrap = false, multi_window = false },
            }
        end,
    },
    {
        '<leader>l',
        mode = { 'n', 'x', 'o' },
        function()
            require 'flash'.jump {
                search = { forward = true, wrap = false, multi_window = false },
            }
        end,
    },
    {
        'm',
        mode = { 'o', 'x' },
        function()
            require 'flash'.treesitter()
        end,
    },
}


return {
    'folke/flash.nvim',
    keys = keys,
    opts = {
        -- jump = {autojump = true}
    },
    event = 'VeryLazy',
    config = function(_, opts)
        require 'flash'.setup(opts)
        local set_hl = api.nvim_set_hl
        set_hl(0, 'FlashLabel', {
            bg = '#ff007c',
            fg = '#c8d3f5',
        })
        set_hl(0, 'FlashMatch', {
            bg = '#5377da',
            fg = '#b6c5f0',
        })
    end,
}
