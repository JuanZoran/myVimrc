local ranger
local lazygit

local config = function(_, opts)
    require("toggleterm").setup(opts)
    local t = require("toggleterm.terminal").Terminal
    lazygit = t:new {
        cmd = 'lazygit',
        hidden = true,
    }


    local ranger_tmpfile = vim.fn.tempname()
    ranger = t:new {
        cmd = 'ranger --choosefiles="' .. ranger_tmpfile .. '"',
        hidden = true,

        on_exit = function()
            local file = io.open(ranger_tmpfile, "r")
            if file == nil then
                return
            end

            local file_name = file:read("*a")
            local cmd = vim.cmd
            file:close()
            os.remove(ranger_tmpfile)
            -- Until edit buffer goes to the correct buffer,
            -- emulate keystrokes to do the same
            cmd("vs " .. file_name)
            cmd [[wincmd h]]
            cmd [[wincmd q]]
        end,
    }
end

return {
    'akinsho/toggleterm.nvim',
    cmd = 'ToggleTerm',
    keys = {
        '<C-d>',
        { '<C-g>', function()
            lazygit:toggle()
        end, desc = 'Toggle Lazygit' },

        { '<C-s>', function()
            ranger:toggle()
        end, desc = 'Toggle Ranger' },
        { '<C-e><C-e>', '<Cmd>ToggleTermSendCurrentLine<CR>',       desc = 'Toggle ranger' },
        { '<C-e>k',     '<Cmd>ToggleTerm direction=horizontal<CR>', desc = 'Toggle ranger' },
        { '<C-e>l',     '<Cmd>ToggleTerm direction=vertical<CR>',   desc = 'Toggle ranger' },
        { '<C-e>i',     '<Cmd>ToggleTerm direction=float<CR>',      desc = 'Toggle ranger' },
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
            border = 'rounded'
        }
    },
    config = config
}
