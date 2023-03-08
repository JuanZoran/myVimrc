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
    MoreMsg                     = {
        -- for ufo virtual text
        fg = '#599eff',
        bold = true,
    },
        ['@variable']           = {
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
        ['@keyword.return'] = {
        fg = '#f55385',
        italic = true,
    },
        ['@constant.builtin'] = {
        fg = '#83aaff',
        italic = true,
    },
        ['@lsp.type.property'] = {
        fg = "#E6C384",
        -- fg = "#b392f0",
    },
    -- ['@property']               = {
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
