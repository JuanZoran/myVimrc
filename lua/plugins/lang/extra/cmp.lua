local default_source = {
    { name = 'nvim_lsp',    group_index = 1 },
    { name = 'luasnip',     group_index = 1, max_item_count = 5 },
    { name = 'cmp_tabnine', group_index = 1, max_item_count = 5 },
    { name = 'buffer',      group_index = 2, max_item_count = 5 },
    { name = 'path' },
}
-- local start_rime = function()
--     local client_id = vim.lsp.start_client {
--         name = 'rime-ls',
--         cmd = { 'rime_ls' },
--         init_options = {
--             enabled = false,                          -- 初始关闭, 手动开启
--             shared_data_dir = '/usr/share/rime-data', -- rime 公共目录
--             user_data_dir = '~/.local/share/rime-ls', -- 指定用户目录, 最好新建一个
--             log_dir = '~/tmp/rime-ls',       -- 日志目录
--             max_candidates = 10,                      -- [v0.2.0 后不再有用] 与 rime 的候选数量配置最好保持一致
--             trigger_characters = {},                  -- 为空表示全局开启
--             schema_trigger_character = '&',           -- [since v0.2.0] 当输入此字符串时请求补全会触发 “方案选单”
--             always_incomplete = false,                -- [since v0.2.3] true 强制补全永远刷新整个列表，而不是使用过滤
--             max_tokens = 0,                           -- [since v0.2.3] 大于 0 表示会在删除到这个字符个数的时候，重建所有候选词，而不使用删除字符操作
--             preselect_first = false,                  -- [since v0.2.3] 是否默认第一个候选项是选中状态，default false
--         },
--     };
--     if client_id then
--         vim.lsp.buf_attach_client(0, client_id)
--         vim.keymap.set('n', '<leader><leader>r',
--             function() vim.lsp.buf.execute_command { command = 'rime-ls.toggle-rime' } end)
--         vim.keymap.set('n', '<leader>rs',
--             function() vim.lsp.buf.execute_command { command = 'rime-ls.sync-user-data' } end)
--     end
-- end

-- -- 对每个文件都默认开启
-- vim.api.nvim_create_autocmd('BufReadPost', {
--     callback = start_rime,
--     pattern = '*',
-- })


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
        ['<C-b>'] = function(fallback)
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
                compare.kind,          -- lspkind defined by lsp protocol
                compare.recently_used, -- based on last used
                compare.locality,      -- position in buffer
                -- tabnine_compare,
                compare.score,
                compare.exact, -- match exact
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
