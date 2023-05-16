local c        = {
    dim_gray     = '#2d4f67',
    dark         = '#0c0e0f',
    dim_blue     = '#6791c9',
    disabled     = '#707880',
    dim          = '#282832',
    gray         = '#8a8e97',
    rosewater    = '#f5e0dc',
    flamingo     = '#f2cdcd',
    pink         = '#f5c2e7',
    mauve        = '#cba6f7',
    red          = '#f38ba8',
    dark_red     = '#f55385',
    maroon       = '#eba0ac',
    white        = '#ffffff',
    peach        = '#fab387',
    yellow       = '#f9e2af',
    green        = '#a6e3a1',
    light_green  = '#89e051',
    custom       = '#69bbae',
    teal         = '#94e2d5',
    sky          = '#89dceb',
    sapphire     = '#74c7ec',
    blue         = '#89b4fa',
    light_blue   = '#599eff',
    lavender     = '#b4befe',
    base         = '#1e1e2e',
    mantle       = '#181825',
    purple       = '#7c3aed',
    light_purple = '#c61ad9',
}

local override = {
    Visual                 = {
        fg = c.sapphire,
        bg = c.dim,
    },
    PmenuSel               = {
        bold = true,
        fg = c.mantle,
        bg = c.light_green,
        -- fg = c.sapphire,
        -- bg = c.dim,
    },
    IncSearch              = {
        fg = c.mantle,
        bg = c.sky,
    },
    Search                 = {
        link = 'IncSearch'
    },
    MoreMsg                = {
        fg = c.light_blue,
        bold = true,
    },
    Cursor                 = {
        bg = c.light_blue,
    },

    CursorLine             = {
        bg = c.base,
    },
    TermCursor             = {
        link = 'Cursor'
    },
    CursorIM               = {
        link = 'Cursor',
    },
    NormalFloat            = {
        link = 'Normal'
    },
    SagaBorder             = {
        fg = c.purple,
        bg = 'NONE',
    },
    CodeActionText         = {
        fg = c.light_blue,
    },
    -- ['@property']               = {
    NavicSeparator         = {
        link = '@keyword',
    },

    IlluminatedWordText    = {
        bg = c.dim_gray,
    },
    IlluminatedWordRead    = {
        link = 'IlluminatedWordText',
    },
    IlluminatedWordWrite   = {
        link = 'IlluminatedWordText',
    },
    ['@variable']          = {
        fg = '#f4b085',
    },
    ['@keyword.return']    = {
        fg = c.dark_red,
        italic = true,
    },
    ['@constant.builtin']  = {
        fg = c.blue,
        italic = true,
    },
    ['@lsp.type.property'] = {
        fg = c.peach,
    },
    ['@lsp.type.enum']                     = {
        -- link = 'enum',
        fg = '#94e2d5',
    },

    ['@lsp.typemod.method.defaultLibrary'] = {
        fg = '#94e2d5',
    },
    -- ['@lsp.type.enumMember'] = {
    --     link = 'enumMember',
    -- },

    CmpItemAbbr            = {
        fg = c.sapphire,
    },
    CmpItemAbbrMatch       = {
        fg = c.purple,
        bold = true,
    },
    CmpItemMenu            = {
        fg = c.blue,
    },
    CmpItemAbbrMatchFuzzy  = {
        link = 'CmpItemAbbrMatch',
    },

    MiniIndentscopeSymbol = {
        link = 'MoreMsg',
    },

    BufferLineBufferSelected = {
        fg = c.sapphire,
    },


    -- IndentBlanklineContextChar  = {
    --     fg = '#89e051'
    -- },
    -- IndentBlanklineContextStart = {
    --     underline = true,
    --     sp = '#89e051',
    -- },
    --     fg = "#E6C384",
    --     -- fg = "#b392f0",
    -- },

    -- FloatBorder                 = {
    --     fg = '#89B4FA',
    --     bg = 'NONE',
    -- },
    -- FloatTitle                  = {
    --     fg = '#938aa9',
    --     bg = 'NONE',
    -- },
}

if vim.g.neovide then
    override.Normal = {
        fg = '#89b4fa',
        bg = '#1e1e2e',
    }
end
return override
