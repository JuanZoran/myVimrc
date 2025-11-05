function get_plug(plug_name)
    return require ('plugins.ui.' .. plug_name)
end


return {
    get_plug 'icons',
    get_plug 'catppuccin',
    get_plug 'bufferline',
    get_plug 'lualine',
    get_plug 'noice',
    get_plug 'todos',
}

-- FIXME :
-- {
--     'nvim-neo-tree/neo-tree.nvim',
--     keys = {
--         { '<C-w><C-w>', '<Cmd>Neotree toggle<CR>',     desc = '📁Toggle File Explorer' },
--         { '<C-w>b',     '<Cmd>Neotree buffers<CR>',    desc = '📁Neo-tree Buffers' },
--         { '<C-w>g',     '<Cmd>Neotree git_status<CR>', desc = '📁Neo-tree Git Status' },
--         { '<C-w>f',     '<Cmd>Neotree dir=~<CR>',      desc = '📁File Explorer from HOME' },
--         {
--             '<C-w>d',
--             '<Cmd>Neotree reveal_force_cwd dir=%:h toggle<CR>',
--             desc =
--             '📁Toggle File Explorer in buffer dir',
--         },
--     },
--     branch = 'v2.x',
--     opts = function()
--         return require 'plugins.ui.neo-tree'
--     end,
-- }
