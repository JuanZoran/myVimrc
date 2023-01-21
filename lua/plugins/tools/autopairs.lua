require("nvim-autopairs").setup {
    -- check_ts = true,
    enable_abbr = true,
    fast_wrap = {
        map = "<C-r>",
        chars = { "{", "[", "(", '"', "'", "<" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        offset = 1, -- Offset from pattern match
        end_key = "l",
        -- keys = "qwertyuiopzxcvbnmasdfghjkl",
        keys = "uiopghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        -- highlight_grey = "LineNr",
        highlight_grey = "Comment",
    },
}
