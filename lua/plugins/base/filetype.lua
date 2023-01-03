-- In init.lua or filetype.nvim's config file
require("filetype").setup({
    overrides = {
        extensions = {
            -- Set the filetype of *.pn files to potion
            c = "c",
            sh = "sh",
            h = "cpp",
        },
        -- literal = {
        --     -- Set the filetype of files named "MyBackupFile" to lua
        --     MyBackupFile = "lua",
        -- },
        -- complex = {
        --     -- Set the filetype of any full filename matching the regex to gitconfig
        --     [".*git/config"] = "gitconfig", -- Included in the plugin
        -- },

        -- The same as the ones above except the keys map to functions
        function_extensions = {
            md = function()
                -- vim.g.mkdp_auto_start = 1
                vim.bo.filetype = "markdown"
                vim.keymap.set("n", "mp", "<Plug>MarkdownPreviewToggle", { buffer = true })
                -- TODO config title mapping
                -- vim.keymap.set({'n', 'i'}, '<A-=>', '')
            end,
            cpp = function()
                vim.bo.filetype = "cpp"
                -- Remove annoying indent jumping
                -- vim.bo.cinoptions = vim.bo.cinoptions .. "L0"

                -- switch header / source
                vim.keymap.set({ "i", "n" }, "<C-k>", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = true })
            end,

            py = function()
                vim.bo.filetype = 'python'
                vim.keymap.set({ "i", "n" }, "<C-k>", "<cmd>PyrightOrganizeImports<CR>", { buffer = true })
            end,
            --     ["pdf"] = function()
            --         vim.bo.filetype = "pdf"
            --         -- Open in PDF viewer (Skim.app) automatically
            --         vim.fn.jobstart(
            --             "open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
            --         )
            --     end,
        },
        -- function_literal = {
        --     Brewfile = function()
        --         vim.cmd("syntax off")
        --     end,
        -- },
        -- function_complex = {
        --     ["*.math_notes/%w+"] = function()
        --         vim.cmd("iabbrev $ $$")
        --     end,
        -- },
        --
        -- shebang = {
        --     -- Set the filetype of files with a dash shebang to sh
        --     dash = "sh",
        -- },
    },
})
