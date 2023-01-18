require("nvim-autopairs").setup {
    -- check_ts = true,
    enable_abbr = true,
    fast_wrap = {
        map = "<C-l>",
        chars = { "{", "[", "(", '"', "'", "<" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        offset = 1, -- Offset from pattern match
        end_key = "l",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        -- highlight_grey = "LineNr",
        highlight_grey = "Comment",
    },
}
