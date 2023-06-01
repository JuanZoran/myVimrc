local handler = function(virtText, lnum, endLnum, width, truncate)
    local get_width = vim.api.nvim_strwidth

    local newVirtText = {}
    local suffix = (' 💌   %d '):format(endLnum - lnum)
    local sufWidth = get_width(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = get_width(chunkText)
        if targetWidth > curWidth + chunkWidth then
            newVirtText[#newVirtText + 1] = chunk
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            newVirtText[#newVirtText + 1] = { chunkText, hlGroup }
            chunkWidth = get_width(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end

    newVirtText[#newVirtText + 1] = { suffix, 'MoreMsg' }
    return newVirtText
end


return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'BufReadPre',
    opts = {
        fold_virt_text_handler = handler,
        open_fold_hl_timeout = 250,
        provider_selector = function()
            return { 'treesitter', 'indent' }
        end,
        preview = {
            mappings = {
                scrollU = 'I',
                scrollD = 'K',
            },
        },
    },
    config = function(_, opts)
        require 'ufo'.setup(opts)
        local set_hl = vim.api.nvim_set_hl
        set_hl(0, 'Folded', {
            bg = '#33467c',
            bold = true,
        })

        local map = vim.keymap.set
        map('n', 'zR', require 'ufo'.openAllFolds)
        map('n', 'zM', require 'ufo'.closeAllFolds)
        map('n', 'zp', require 'ufo'.peekFoldedLinesUnderCursor)
        map('n', 'zj', require 'ufo'.goPreviousClosedFold)
        map('n', 'zl', require 'ufo'.goNextClosedFold)
    end,
}
-- INFO : some infomation for ufo
--     open_fold_hl_timeout = {
--         description = [[Time in millisecond between the range to be highlgihted and to be cleared
--                     while opening the folded line, `0` value will disable the highlight]],
--         default = 400
--     },
--     provider_selector = {
--         description = [[A function as a selector for fold providers. For now, there are
--                     'lsp' and 'treesitter' as main provider, 'indent' as fallback provider]],
--         default = nil
--     },
--     close_fold_kinds = {
--         description = [[After the buffer is displayed (opened for the first time), close the
--                     folds whose range with `kind` field is included in this option. For now,
--                     'lsp' provider's standardized kinds are 'comment', 'imports' and 'region',
--                     run `UfoInspect` for details if your provider has extended the kinds.]],
--         default = {}
--     },
--     fold_virt_text_handler = {
--         description = [[A function customize fold virt text, see ### Customize fold text]],
--         default = nil
--     },
--     enable_get_fold_virt_text = {
--         description = [[Enable a function with `lnum` as a parameter to capture the virtual text
--                     for the folded lines and export the function to `get_fold_virt_text` field of
--                     ctx table as 6th parameter in `fold_virt_text_handler`]],
--         default = false
--     },
--     preview = {
--         description = [[Configure the options for preview window and remap the keys for current
--                     buffer and preview buffer if the preview window is displayed.
--                     Never worry about the users's keymaps are overridden by ufo, ufo will save
--                     them and restore them if preview window is closed.]],
--         win_config = {
--             border = {
--                 description = [[The border for preview window,
--                     `:h nvim_open_win() | call search('border:')`]],
--                 default = 'rounded',
--             },
--             winblend = {
--                 description = [[The winblend for preview window, `:h winblend`]],
--                 default = 12,
--             },
--             winhighlight = {
--                 description = [[The winhighlight for preview window, `:h winhighlight`]],
--                 default = 'Normal:Normal',
--             },
--             maxheight = {
--                 description = [[The max height of preview window]],
--                 default = 20,
--             }
--         },
--         mappings = {
--             description = [[The table for {function = key}]],
--             default = [[see ###Preview function table for detail]],
--         }
--     }
