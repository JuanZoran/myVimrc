return {
    Visual                      = {
        bg = "#33467c",
    },
    Pmenu                       = {
        fg = '#A6ACCD',
        bg = 'NONE',
    },
    PmenuSel                    = {
        bold = true,
        fg = '#1d202f',
        bg = '#89e051',
    },
    IncSearch                   = {
        fg = "#0f0f15",
        bg = "#10B981",
    },
    MoreMsg                     = { -- for ufo virtual text
        fg = '#599eff',
        bold = true,
    },
    ['@variable']               = {
        fg = '#f4b085',
    },
    DashboardHeader             = {
        -- link = 'MoreMsg',
        fg = '#ff5d62'
    },
    CursorLine                  = {
        bg = '#2e3a4d',
    },
    Cursor                      = {
        bg = '#58a6ff',
    },
    TermCursor                  = {
        link = 'Cursor'
    },
    CursorIM                    = {
        link = 'Cursor',
    },
    NormalFloat                 = {
        link = 'Normal'
    },
    SagaBorder                  = {
        fg = '#7c3aed',
        -- fg = '#599eff',
        bg = 'NONE',
    },
    CodeActionText              = {
        fg = '#1e5cb3',
    },
    IlluminatedWordText         = {
        bg = '#2d4f67',
        -- bg = '#1e5cb3',
    },
    IlluminatedWordRead         = {
        link = 'IlluminatedWordText',
    },
    IlluminatedWordWrite        = {
        link = 'IlluminatedWordText',
    },
    IndentBlanklineContextChar  = {
        fg = '#89e051'
    },
    IndentBlanklineContextStart = {
        underline = true,
        sp = '#89e051',
    },
    ['@property']               = {
        fg = "#E6C384",
        -- fg = "#b392f0",
    },
    ['@keyword.return']         = {
        fg = '#f55385',
        italic = true,
    },

    ['@conditional']         = {
        fg = '#f55385',
    },
    -- FloatBorder                 = {
    --     fg = '#89B4FA',
    --     bg = 'NONE',
    -- },
    -- FloatTitle                  = {
    --     fg = '#938aa9',
    --     bg = 'NONE',
    -- },
}

-- -- kind support
-- CmpItemKindSnippet          = { fg = C.mauve },
-- CmpItemKindKeyword          = { fg = C.red },
-- CmpItemKindText             = { fg = C.teal },
-- CmpItemKindMethod           = { fg = C.blue },
-- CmpItemKindConstructor      = { fg = C.blue },
-- CmpItemKindFunction         = { fg = C.blue },
-- CmpItemKindFolder           = { fg = C.blue },
-- CmpItemKindModule           = { fg = C.blue },
-- CmpItemKindConstant         = { fg = C.peach },
-- CmpItemKindField            = { fg = C.green },
-- CmpItemKindProperty         = { fg = C.green },
-- CmpItemKindEnum             = { fg = C.green },
-- CmpItemKindUnit             = { fg = C.green },
-- CmpItemKindClass            = { fg = C.yellow },
-- CmpItemKindVariable         = { fg = C.flamingo },
-- CmpItemKindFile             = { fg = C.blue },
-- CmpItemKindInterface        = { fg = C.yellow },
-- CmpItemKindColor            = { fg = C.red },
-- CmpItemKindReference        = { fg = C.red },
-- CmpItemKindEnumMember       = { fg = C.red },
-- CmpItemKindStruct           = { fg = C.blue },
-- CmpItemKindValue            = { fg = C.peach },
-- CmpItemKindEvent            = { fg = C.blue },
-- CmpItemKindOperator         = { fg = C.blue },
-- CmpItemKindTypeParameter    = { fg = C.blue },
-- CmpItemKindCopilot       = { fg = C.teal     },
-- local C = {
--     rosewater = "#F4DBD6",
--     flamingo = "#F0C6C6",
--     pink = "#F5BDE6",
--     mauve = "#C6A0F6",
--     red = "#ED8796",
--     maroon = "#EE99A0",
--     peach = "#F5A97F",
--     yellow = "#EED49F",
--     green = "#A6DA95",
--     teal = "#8BD5CA",
--     sky = "#91D7E3",
--     sapphire = "#7DC4E4",
--     blue = "#8AADF4",
--     lavender = "#B7BDF8",

--     text = "#CAD3F5",
--     subtext1 = "#B8C0E0",
--     subtext0 = "#A5ADCB",
--     overlay2 = "#939AB7",
--     overlay1 = "#8087A2",
--     overlay0 = "#6E738D",
--     surface2 = "#5B6078",
--     surface1 = "#494D64",
--     surface0 = "#363A4F",

--     base = "#24273A",
--     mantle = "#1E2030",
--     crust = "#181926",
-- }


-- return {
--     Visual = {
--         bg = "#33467c",
--     },
--     Pmenu = {
--         fg = '#A6ACCD',
--         bg = 'NONE',
--     },
--     PmenuSel = {
--         bold = true,
--         fg = '#1d202f',
--         bg = '#89e051',
--     },

--     IncSearch = {
--         fg = "#0f0f15",
--         bg = "#10B981",
--     },
--     MoreMsg = { -- for ufo virtual text
--         fg = '#599eff',
--         bold = true,
--     },
--     ['@variable'] = {
--         fg = '#f4b085',
--     },

--     DashboardHeader = {
--         -- link = 'MoreMsg',
--         fg = '#ff5d62'
--     },
--     -- ['Identifier'] = {
--     --     fg = '#f4b085',
--     -- },

--     CursorLine = {
--         bg = '#2e3a4d',
--     },
--     Cursor = {
--         bg = '#58a6ff',
--     },
--     TermCursor = {
--         link = 'Cursor'
--     },
--     CursorIM = {
--         link = 'Cursor',
--     },
--     FloatBorder = {
--         fg = '#89B4FA',
--         bg = 'NONE',
--     },
--     FloatTitle = {
--         fg = '#938aa9',
--         bg = 'NONE',
--     },
--     NormalFloat = {
--         link = 'Normal'
--     },
--     SagaBorder = {
--         fg = '#7c3aed',
--         -- fg = '#599eff',
--         bg = 'NONE',
--     },
--     CodeActionText = {
--         fg = '#1e5cb3',
--     },
--     IlluminatedWordText = {
--         bg = '#2d4f67',
--         -- bg = '#1e5cb3',
--     },
--     IlluminatedWordRead = {
--         link = 'IlluminatedWordText',
--     },
--     IlluminatedWordWrite = {
--         link = 'IlluminatedWordText',
--     },
--     IndentBlanklineContextChar = {
--         fg = '#89e051'
--     },
--     IndentBlanklineContextStart = {
--         underline = true,
--         sp = '#89e051',
--     },

--     -- kind support
--     CmpItemKindSnippet       = { fg = C.mauve },
--     CmpItemKindKeyword       = { fg = C.red },
--     CmpItemKindText          = { fg = C.teal },
--     CmpItemKindMethod        = { fg = C.blue },
--     CmpItemKindConstructor   = { fg = C.blue },
--     CmpItemKindFunction      = { fg = C.blue },
--     CmpItemKindFolder        = { fg = C.blue },
--     CmpItemKindModule        = { fg = C.blue },
--     CmpItemKindConstant      = { fg = C.peach },
--     CmpItemKindField         = { fg = C.green },
--     CmpItemKindProperty      = { fg = C.green },
--     CmpItemKindEnum          = { fg = C.green },
--     CmpItemKindUnit          = { fg = C.green },
--     CmpItemKindClass         = { fg = C.yellow },
--     CmpItemKindVariable      = { fg = C.flamingo },
--     CmpItemKindFile          = { fg = C.blue },
--     CmpItemKindInterface     = { fg = C.yellow },
--     CmpItemKindColor         = { fg = C.red },
--     CmpItemKindReference     = { fg = C.red },
--     CmpItemKindEnumMember    = { fg = C.red },
--     CmpItemKindStruct        = { fg = C.blue },
--     CmpItemKindValue         = { fg = C.peach },
--     CmpItemKindEvent         = { fg = C.blue },
--     CmpItemKindOperator      = { fg = C.blue },
--     CmpItemKindTypeParameter = { fg = C.blue },
--     -- CmpItemKindCopilot       = { fg = C.teal     },
-- }
