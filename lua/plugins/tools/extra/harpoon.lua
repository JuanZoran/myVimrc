return {
    'ThePrimeagen/harpoon',
    keys = {
        { '<Leader>ac', '<Cmd>lua require"harpoon.cmd-ui".toggle_quick_menu()<CR>', desc = ' Open Commands List' },
        { '<Leader>am', '<Cmd>lua require"harpoon.ui".toggle_quick_menu()<CR>',     desc = ' Open quick menu' },
        { '<Leader>ai', '<Cmd>lua require"harpoon.mark".add_file()<CR>',            desc = ' Add current file to list' },
        {
            '<leader>ah',
            '<cmd>Telescope harpoon marks<cr>',
            desc =
            ' show all the marks by telescope'
        },
        {
            '<Leader>aj',
            '<Cmd>lua require"harpoon.ui".nav_prev()<CR>',
            desc =
            'ﭢ Jump to next file on the list'
        },
        {
            '<Leader>al',
            '<Cmd>lua require"harpoon.ui".nav_next()<CR>',
            desc =
            'ﭠ Jump to last file on the list'
        },
    },
    config = function()
        require 'telescope'.load_extension 'harpoon'
    end,
}
