require("bufferline").setup {
    options = {
        -- use nvim native lsp
        diagnostics = "nvim-lsp",
        offsets = { {
            filetype = "NvimTree",
            text = "文件",
            highlight = "Directory",
            text_align = "left"
        } }
    }
}
