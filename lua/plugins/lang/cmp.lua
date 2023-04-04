local cmp = require 'cmp'
local luasnip = require 'luasnip'
local copilot = require 'copilot.suggestion'
local kind_icons = util.icon.code_icon

local menu = {
    luasnip  = '[Snippet]',
    nvim_lsp = '[LSP]',
    path     = '[Path]',
    buffer   = '[Buffer]',
    -- copilot  = "[Copilot]",
    -- codeium  = '[Codeium]',
}

local source = {
    { name = 'path' },
    { name = 'nvim_lsp', group_index = 1 --[[  max_item_count = 8, ]] },
    { name = 'luasnip',  group_index = 1,                             max_item_count = 4 },
    { name = 'buffer',   group_index = 2,                             max_item_count = 4 },
}

local next = cmp.mapping(function()
    if cmp.visible() then
        cmp.select_next_item()
    else
        cmp.mapping.complete()()
    end
end, { 'i', 'c' })

local prev = cmp.mapping(function()
    if cmp.visible() then
        cmp.select_prev_item()
    else
        cmp.mapping.complete()()
    end
end, { 'i', 'c' })


cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    experimental = {
        ghost_text = false,
    },
    mapping = {
        ['<C-d>'] = function(fallback)
            if not require 'noice.lsp'.scroll(4) and not cmp.scroll_docs(4) then
                fallback()
            end
        end,
        ['<C-u>'] = function(fallback)
            if not require 'noice.lsp'.scroll(-4) and not cmp.scroll_docs(-4) then
                fallback()
            end
        end,
        ['<C-Space>'] = cmp.mapping {
            i = function()
                if luasnip.choice_active() then
                    luasnip.change_choice()
                elseif copilot.is_visible() then
                    copilot.next()
                else
                    ---@diagnostic disable-next-line: missing-parameter
                    cmp.mapping.complete()()
                end
            end,
            ---@diagnostic disable-next-line: missing-parameter
            c = cmp.mapping.complete(),
        },
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-c>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm { select = false },
        ['<C-o>'] = cmp.mapping.confirm { select = true },
        ['<C-e>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable() then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
                copilot.accept()
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-p>'] = prev,
        ['<C-k>'] = next,
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            -- Kind icons
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = menu[entry.source.name]
            return vim_item
        end,
    },
    sources = source,
    window = {
        documentation = cmp.config.window.bordered(),
        completion = {
            border = 'rounded',
            winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel',
            col_offset = -3,
            side_padding = 0,
        },
    },
    sorting = {
        comparators = {
            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
}


-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'cmdline_history', max_item_count = 5 },
    },
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline',         max_item_count = 5, option = { ignore_cmds = { 'Man', '!' } } },
        { name = 'cmdline_history', max_item_count = 5 },
    }),
})

-- If you want insert `(` after select function or method item
cmp.event:on(
    'confirm_done',
    require 'nvim-autopairs.completion.cmp'.on_confirm_done()
)
