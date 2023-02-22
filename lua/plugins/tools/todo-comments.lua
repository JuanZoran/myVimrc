local icon = require('util').icon.comment

require("todo-comments").setup {
    -- signs = true, -- show icons in the signs column
    -- sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
        FIX = {
            icon = icon.Fix, -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            --     alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            --     -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = icon.Todo, color = "info" },
        HACK = { icon = icon.Hack, --[[ color = "warning" ,]] alt = { 'EXAMPLE' } },
        WARN = { icon = icon.Warn, color = "warning", alt = { "WARNING", } },
        PERF = { icon = icon.Perf, --[[ color = 'default', ]] alt = { "OPTIMIZE" } },
        NOTE = { icon = icon.Note, color = "hint", alt = { "INFO" } },
        TEST = { icon = icon.Test, color = "test", alt = { "PASSED", "FAILED" } },
    },
    -- gui_style = {
    --   fg = "NONE", -- The gui style to use for the fg highlight group.
    --   bg = "BOLD", -- The gui style to use for the bg highlight group.
    -- },
    -- merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
        multiline = true, -- enable multine todo comments
        -- multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        -- multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        -- before = "", -- "fg" or "bg" or empty
        keyword = "wide_bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        -- after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s?]], -- pattern or table of patterns, used for highlightng (vim regex)
        -- comments_only = true, -- uses treesitter to match keywords in comments only
        -- max_line_len = 400, -- ignore lines longer than this
        -- exclude = {}, -- list of file types to exclude highlighting
    },
    -- list of named colors where we try to extract the guifg from the
    -- INFO  list of highlight groups or use the hex color if hl not found as a fallback
    colors = {
        error = { "#DC2626" },
        warning = { "#FBBF24" },
        info = { "#2563EB" },
        hint = { "#10B981" },
        default = { "#7C3AED" },
        test = { "#89e051" }
    },
    -- search = {
    --       command = "rg",
    --       args = {
    --         "--color=never",
    --         "--no-heading",
    --         "--with-filename",
    --         "--line-number",
    --         "--column",
    --       },
    --       -- regex that will be used to match keywords.
    --       -- don't replace the (KEYWORDS) placeholder
    --       pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    --     -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    -- },
}

local set = vim.keymap.set
set("n", "<Leader>tl", require("todo-comments").jump_next, { desc = "Next todo comment" })
set("n", "<Leader>tj", require("todo-comments").jump_prev, { desc = "Previous todo comment" })

set("n", "<Leader>to", "<cmd>TodoQuickFix<cr>",            { desc = "show all TODOs" })
set("n", "<Leader>td", "<cmd>TodoTelescope<cr>",           { desc = "search todos by telescope" })
