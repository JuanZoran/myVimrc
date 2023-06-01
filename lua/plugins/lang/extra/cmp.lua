local default_source = {
    { name = 'luasnip',     group_index = 1, max_item_count = 4 },
    { name = 'nvim_lsp',    group_index = 1 },
    { name = 'cmp_tabnine', group_index = 2, max_item_count = 5 },
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

    local prev = cmp.mapping {
        i = function()
            if cmp.visible() then
                cmp.select_prev_item()
            else
                cmp.mapping.complete()()
            end
        end,
        -- c = function ()
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     else
        --         cmp.mapping.complete()()
        --     end
        -- end,
    }
    local mapping = {
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
        ['<Tab>'] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
                copilot.accept()
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm { select = false },
        ['<C-o>'] = cmp.mapping.confirm { select = true },
        ['<C-e>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-b>'] = function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
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
    local tabnine_compare = function(entry1, entry2)
        if entry1.source.name == 'cmp_tabnine' and entry2.source.name == 'cmp_tabnine' then
            if not entry1.completion_item.priority then
                return false
            elseif not entry2.completion_item.priority then
                return true
            else
                return (entry1.completion_item.priority > entry2.completion_item.priority)
            end
        end
    end

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
                local max_width = math.floor(vim.o.columns * 0.4)
                vim_item.abbr = #vim_item.abbr > max_width
                    and vim_item.abbr:sub(1, max_width) .. ' 💤' or vim_item.abbr
                return vim_item
            end,
        },
        experimental = { ghost_text = false, native_menu = false },
        mapping = mapping,
        sorting = {
            -- priority_weight = 10,
            comparators = {
                -- fallback until when a sort function returns not nil
                compare.recently_used, -- based on last used
                compare.locality,      -- position in buffer
                compare.kind,          -- lspkind defined by lsp protocol
                tabnine_compare,
                compare.score,
                compare.exact, -- match exact
            },
        },
    }
end

local sources = {
    'hrsh7th/cmp-buffer',
    { 'hrsh7th/cmp-nvim-lsp', cond = not util.firenvim },
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-cmdline',
    'dmitmel/cmp-cmdline-history',
    {
        'tzachar/cmp-tabnine',
        build = './install.sh',
        config = function()
            require 'cmp_tabnine.config':setup {
                max_lines = 1000,
                max_num_results = 20,
                sort = true,
                run_on_every_keystroke = true,
                snippet_placeholder = '..',
                show_prediction_strength = false,
            }
        end,
    },
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
    {
        'windwp/nvim-autopairs',
        opts = {
            check_ts = true,
            enable_abbr = true,
            fast_wrap = {
                map = '<C-;>',
                chars = { '{', '[', '(', '"', "'", '<' },
                pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                offset = 1, -- Offset from pattern match
                end_key = ';',
                -- keys = "qwertyuiopzxcvbnmasdfghjkl",
                keys = 'uiopghjkl',
                check_comma = true,
                highlight = 'PmenuSel',
                -- highlight_grey = "LineNr",
                highlight_grey = 'Comment',
            },
        },
    },
    -- 'octaltree/cmp-look',
    -- { "jcdickinson/codeium.nvim", config = true },
}

return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = opts,
    version = false,
    dependencies = sources,
}
