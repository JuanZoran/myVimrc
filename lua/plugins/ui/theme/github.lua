-- *bold* *underline* *undercurl*
-- *underdouble* *underdotted*
-- *underdashed* *inverse* *italic*
-- *standout* *nocombine* *strikethrough*
require('github-theme').setup {
    theme_style = "dark_default", -- dark | dark_default | dimmed | dark_colorblind | light | light_default | light_colorblind
    function_style = "italic",
    -- keyword_style = "italic",
    -- dark_sidebar = false,
    -- dark_float = false,
    -- comment_style = "italic",
    transparent = true,
    overrides = function(_)
        return {
            IncSearch = { fg = "#c9d1d9", bg = "#ff4081" },
        }
    end
}
