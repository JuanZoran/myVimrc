local snippets_folder = vim.fn.stdpath 'config' .. '/lua/snips'
local ls = require 'luasnip'
local types = require 'luasnip.util.types'

ls.config.set_config {
    updateevents = { 'TextChanged', 'TextChangedI' },
    region_check_events = { 'CursorHold', 'InsertLeave' },
    delete_check_events = { 'TextChanged', 'InsertEnter' },
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { ' Your Choice', 'Title' } }, -- yellow
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { ' Insert', 'Function' } }, -- purple
            },
        },
    },
}


require 'luasnip.loaders.from_lua'.lazy_load { paths = snippets_folder }
vim.keymap.set('n', '<leader><cr>', require 'luasnip.loaders.from_lua'.edit_snippet_files,
    { desc = 'Edit Snippet' })
require 'luasnip.loaders.from_vscode'.lazy_load()

-- NOTE :Chioce Note Popup
-- local api = vim.api
-- local current_nsid = api.nvim_create_namespace("LuaSnipChoiceListSelections")
-- local current_win = nil

-- local function window_for_choiceNode(choiceNode)
--     local buf = api.nvim_create_buf(false, true)
--     local buf_text = {}
--     local row_selection = 0
--     local row_offset = 0
--     local text
--     for _, node in ipairs(choiceNode.choices) do
--         text = node:get_docstring()
--         -- find one that is currently showing
--         if node == choiceNode.active_choice then
--             -- current line is starter from buffer list which is length usually
--             row_selection = #buf_text
--             -- finding how many lines total within a choice selection
--             row_offset = #text
--         end
--         vim.list_extend(buf_text, text)
--     end

--     api.nvim_buf_set_text(buf, 0, 0, 0, 0, buf_text)
--     local w, h = vim.lsp.util._make_floating_popup_size(buf_text)

--     -- adding highlight so we can see which one is been selected.
--     local extmark = api.nvim_buf_set_extmark(buf, current_nsid, row_selection, 0,
--         { hl_group = 'incsearch', end_line = row_selection + row_offset })

--     -- shows window at a beginning of choiceNode.
--     local win = api.nvim_open_win(buf, false, {
--         relative = "win",
--         width = w,
--         height = h,
--         bufpos = choiceNode.mark:pos_begin_end(),
--         style = "minimal",
--         border = 'rounded'
--     })

--     -- return with 3 main important so we can use them again
--     return { win_id = win, extmark = extmark, buf = buf }
-- end

-- local function choice_popup(choiceNode)
--     -- build stack for nested choiceNodes.
--     if current_win then
--         api.nvim_win_close(current_win.win_id, true)
--         api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
--     end
--     local create_win = window_for_choiceNode(choiceNode)
--     current_win = {
--         win_id = create_win.win_id,
--         prev = current_win,
--         node = choiceNode,
--         extmark = create_win.extmark,
--         buf = create_win.buf
--     }
-- end

-- local function update_choice_popup(choiceNode)
--     api.nvim_win_close(current_win.win_id, true)
--     api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
--     local create_win = window_for_choiceNode(choiceNode)
--     current_win.win_id = create_win.win_id
--     current_win.extmark = create_win.extmark
--     current_win.buf = create_win.buf
-- end

-- local function choice_popup_close()
--     api.nvim_win_close(current_win.win_id, true)
--     api.nvim_buf_del_extmark(current_win.buf, current_nsid, current_win.extmark)
--     -- now we are checking if we still have previous choice we were in after exit nested choice
--     current_win = current_win.prev
--     if current_win then
--         -- reopen window further down in the stack.
--         local create_win = window_for_choiceNode(current_win.node)
--         current_win.win_id = create_win.win_id
--         current_win.extmark = create_win.extmark
--         current_win.buf = create_win.buf
--     end
-- end


-- local autocmd = api.nvim_create_autocmd
-- local group = api.nvim_create_augroup('choice_popup', { clear = true })
-- autocmd('User', {
--     pattern = 'LuasnipChoiceNodeEnter',
--     group = group,
--     callback = function()
--         choice_popup(require("luasnip").session.event_node)
--     end,
-- })

-- autocmd('User', {
--     pattern = 'LuasnipChoiceNodeLeave',
--     group = group,
--     callback = function()
--         choice_popup_close()
--     end,
-- })

-- autocmd('User', {
--     pattern = 'LuasnipChangeChoice',
--     group = group,
--     callback = function()
--         update_choice_popup(require("luasnip").session.event_node)
--     end,
-- })
