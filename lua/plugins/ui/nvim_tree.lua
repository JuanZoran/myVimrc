local nvim_tree = require("nvim-tree")
local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.4 -- You can change this too

local icon = require('util').icon
nvim_tree.setup {
    respect_buf_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    -- sort_by = "name",
    open_on_tab = false,
    -- hijack_cursor = false,
    update_cwd = true,
    -- hijack_directories = {
    -- enable = true,
    -- auto_open = true,
    -- },
    diagnostics = {
        enable = true,
        icons = {
            hint = icon.Hint,
            info = icon.Info,
            warning = icon.Warn,
            error = icon.Error,
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        mappings = {
            -- custom_only = true, -- 只用自定义的按键
            list = {
                { key = "u", action = "dir_up" },
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") }, -- 打开文件
                { key = "h", cb = tree_cb("close_node") },
                { key = "v", cb = tree_cb("vsplit") },
                { key = { "<Tab>", "<2-RightMouse>" }, action = "cd" },
                { key = "<C-p>", action = "preview" },
                { key = "?", action = "toggle_help" },
            },
        },
        float = {
            enable = true,
            open_win_config = function()
                local opt = vim.opt
                local screen_w = opt.columns:get()
                local screen_h = opt.lines:get() - opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((opt.lines:get() - window_h) / 2) - opt.cmdheight:get()
                return {
                    border = 'rounded',
                    relative = 'editor',
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
        width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
    },
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        highlight_opened_files = "icon", -- can be [icon, name, all, none]
        -- NOTE: nvim_tree icon
        icons = {
            -- show = {
            --     file = true,
            --     folder = true,
            --     folder_arrow = true,
            --     git = true,
            -- },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "", -- arrow when folder is open
                },
            },
        },
        special_files = {
            "README.md",
            "readme.md",
            "xmake.lua",
            "CMakeLists.txt",
        },
    },
    -- tab = {
    -- sync = {
    -- open = false,
    -- close = false,
    -- ignore = {},
    -- },
    -- },
}

vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
    pattern = "NvimTree_*",
    callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and
            vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and
            layout[3] == nil then vim.cmd("confirm quit") end
    end
})

-- INFO view.mappings.list = { -- BEGIN_DEFAULT_MAPPINGS
--   { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
--   { key = "<C-e>",                          action = "edit_in_place" },
--   { key = "O",                              action = "edit_no_picker" },
--   { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
--   { key = "<C-v>",                          action = "vsplit" },
--   { key = "<C-x>",                          action = "split" },
--   { key = "<C-t>",                          action = "tabnew" },
--   { key = "<",                              action = "prev_sibling" },
--   { key = ">",                              action = "next_sibling" },
--   { key = "P",                              action = "parent_node" },
--   { key = "<BS>",                           action = "close_node" },
--   { key = "<Tab>",                          action = "preview" },
--   { key = "K",                              action = "first_sibling" },
--   { key = "J",                              action = "last_sibling" },
--   { key = "I",                              action = "toggle_git_ignored" },
--   { key = "H",                              action = "toggle_dotfiles" },
--   { key = "U",                              action = "toggle_custom" },
--   { key = "R",                              action = "refresh" },
--   { key = "a",                              action = "create" },
--   { key = "d",                              action = "remove" },
--   { key = "D",                              action = "trash" },
--   { key = "r",                              action = "rename" },
--   { key = "<C-r>",                          action = "full_rename" },
--   { key = "x",                              action = "cut" },
--   { key = "c",                              action = "copy" },
--   { key = "p",                              action = "paste" },
--   { key = "y",                              action = "copy_name" },
--   { key = "Y",                              action = "copy_path" },
--   { key = "gy",                             action = "copy_absolute_path" },
--   { key = "[e",                             action = "prev_diag_item" },
--   { key = "[c",                             action = "prev_git_item" },
--   { key = "]e",                             action = "next_diag_item" },
--   { key = "]c",                             action = "next_git_item" },
--   { key = "-",                              action = "dir_up" },
--   { key = "s",                              action = "system_open" },
--   { key = "f",                              action = "live_filter" },
--   { key = "F",                              action = "clear_live_filter" },
--   { key = "q",                              action = "close" },
--   { key = "W",                              action = "collapse_all" },
--   { key = "E",                              action = "expand_all" },
--   { key = "S",                              action = "search_node" },
--   { key = ".",                              action = "run_file_command" },
--   { key = "<C-k>",                          action = "toggle_file_info" },
--   { key = "g?",                             action = "toggle_help" },
--   { key = "m",                              action = "toggle_mark" },
--   { key = "bmv",                            action = "bulk_move" },
-- } -- END_DEFAULT_MAPPINGS
--
