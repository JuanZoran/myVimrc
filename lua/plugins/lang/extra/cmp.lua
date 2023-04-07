local default_source = {
    { name = 'nvim_lsp',    group_index = 1 },
    { name = 'luasnip',     group_index = 1, max_item_count = 5 },
    { name = 'cmp_tabnine', group_index = 1, max_item_count = 5 },
    { name = 'buffer',      group_index = 2, max_item_count = 5 },
    { name = 'path' },
}

local opts = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local copilot = require 'copilot.suggestion'
    local kind_icons = util.icon.code_icon
    local menu = {
        luasnip     = '[Snippet]',
        nvim_lsp    = '[LSP]',
        path        = '[Path]',
        buffer      = '[Buffer]',
        look        = '[Look]',
        cmp_tabnine = '[TabNine]',
        -- copilot  = "[Copilot]",
        -- codeium  = '[Codeium]',
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

    local mapping = {
        ['<C-d>'] = function(fallback)
            if not require 'noice.lsp'.scroll(4) and cmp.mapping.scroll_docs(4) then
                fallback()
            end
        end,
        ['<C-u>'] = function(fallback)
            if not require 'noice.lsp'.scroll(-4) and cmp.mapping.scroll_docs(-4) then
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
        ['<CR>'] = cmp.mapping.confirm { select = false },
        ['<C-o>'] = cmp.mapping.confirm { select = true },
        ['<C-e>'] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable() then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-C-e>'] = function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
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
        sources = cmp.config.sources {
            { name = 'path' },
            { name = 'cmdline',         option = { ignore_cmds = { 'Man', '!' } } },
            { name = 'cmdline_history', option = { history_type = ':' },          max_item_count = 3 },
        },
    })


    -- If you want insert `(` after select function or method item
    cmp.event:on(
        'confirm_done',
        require 'nvim-autopairs.completion.cmp'.on_confirm_done()
    )

    local compare = cmp.config.compare

    return {
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            documentation = cmp.config.window.bordered(),
            completion = {
                border = 'rounded',
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel',
                col_offset = -3,
                side_padding = 0,
            },
        },
        sources = default_source,
        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(entry, vim_item)
                vim_item.kind =
                    (kind_icons[vim_item.kind] or '') .. ' ' .. vim_item.kind

                vim_item.menu = menu[entry.source.name]
                return vim_item
            end,
        },
        experimental = { ghost_text = false, native_menu = false },
        mapping = mapping,
        sorting = {
            -- priority_weight = 10,
            comparators = {
                -- fallback until when a sort function returns not nil
                compare.kind,                  -- lspkind defined by lsp protocol
                compare.recently_used,         -- based on last used
                compare.locality,              -- position in buffer
                -- tabnine_compare,
                compare.score,
                compare.exact,                 -- match exact
            },
        },
    }
end



local sources = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-cmdline',
    'dmitmel/cmp-cmdline-history',
    -- { "jcdickinson/codeium.nvim", config = true },
    {
        'zbirenbaum/copilot.lua',
        opts = {
            panel = { enabled = false },
            auto_refresh = true,
            suggestion = {
                enable = true,
                auto_trigger = true,
                keymap = false,
            },
            filetypes = {
                ['*'] = true,
            },
        },
    },
}



return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = opts,
    version = false,
    dependencies = sources,
}
