local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("cmp error", "error")
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    vim.notify("luasnip error", "error")
    return
end

local kind_icons = require('util').icon.code_icon
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    experimental = {
        -- native_menu = false,
        ghost_text = true,
    },
    mapping = {
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping {
            i = function(_)
                if luasnip.choice_active() then
                    luasnip.change_choice()
                else
                    cmp.mapping.complete()()
                end
            end,
            c = cmp.mapping.complete()
        },
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-j>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-o>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping(function(fallback)
            -- TODO: config some
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- TODO: config some
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        -- ["<C-i>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "!" }),
    },

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                luasnip     = "[Snippet]",
                nvim_lsp    = "[LSP]",
                -- nvim_lua    = "[NVIM]",
                path        = "[Path]",
                cmp_tabnine = "[TabNine]",
                buffer      = "[Buffer]",
                rg          = "[REG]",
                -- neorg       = "[Neorg]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp", max_item_count = 5 },
        { name = "luasnip" },
        { name = "cmp_tabnine", max_item_count = 5 },
        -- { name = "nvim_lua" },
        { name = "buffer", max_item_count = 4 },
        { name = "rg", max_item_count = 4 },
        { name = "path" },
    },
    -- confirm_opts = {
    --     behavior = cmp.ConfirmBehavior.Replace,
    --     select = false,
    -- },
    window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(),
        -- documentation = {
        --     border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        -- },
        -- completion = {
        --     winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        --     col_offset = -3,
        --     side_padding = 0,
        -- },
    },
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" },
            },
        },
    }),
})
