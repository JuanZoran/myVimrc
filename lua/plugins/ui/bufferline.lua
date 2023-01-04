-- NOTE mouse events can be attached to bufferline: see help bufferline-hover-events
-- help for `bufferline-configturation`
require("bufferline").setup {
    options = {
        -- -- use nvim native lsp
        -- FIX  it doesn't work
        -- indicator = {
        --     icon = '▎', -- this should be omitted if indicator style is not 'icon'
        --     style = 'icon',
        -- },
        -- diagnostics = "nvim-lsp",
        -- diagnostics_indicator = function(_, _, diagnostics_dict, _)
        --     print('jlasdj')
        --     local s = " "
        --     for e, n in pairs(diagnostics_dict) do
        --         local sym = e == "error" and " "
        --             or (e == "warning" and " " or "")
        --         s = s .. n .. sym
        --     end
        --     return s
        -- end,
        show_buffer_close_icons = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        modified_icon = "💌",
        separator_style = "slant", -- slant, padded_slant | triky
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center",
            },
        },
        hover = {
            enabled = false,
            delay = 200,
            reveal = { 'close' }
        },
    },
}
