---@diagnostic disable: unused-local, undefined-global
-- =========== builtin function for luasnip ===================
-- s      = require("luasnip.nodes.snippet").S
-- sn     = require("luasnip.nodes.snippet").SN
-- t      = require("luasnip.nodes.textNode").T
-- f      = require("luasnip.nodes.functionNode").F
-- i      = require("luasnip.nodes.insertNode").I
-- c      = require("luasnip.nodes.choiceNode").C
-- d      = require("luasnip.nodes.dynamicNode").D
-- r      = require("luasnip.nodes.restoreNode").R
-- l      = require("luasnip.extras").lambda
-- rep    = require("luasnip.extras").rep
-- p      = require("luasnip.extras").partial
-- m      = require("luasnip.extras").match
-- n      = require("luasnip.extras").nonempty
-- dl     = require("luasnip.extras").dynamic_lambda
-- fmt    = require("luasnip.extras.fmt").fmt
-- fmta   = require("luasnip.extras.fmt").fmta
-- conds  = require("luasnip.extras.expand_conditions")
-- types  = require("luasnip.util.types")
-- events = require("luasnip.util.events")
-- parse  = require("luasnip.util.parser").parse_snippet
-- ai     = require("luasnip.nodes.absolute_indexer")


-- NOTE: Utility function
-- local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
-- local file_pattern = "*.lua"

-- local function cs(trigger, nodes, opts) --{{{
-- 	local snippet = s(trigger, nodes)
-- 	local target_table = snips
--
-- 	local pattern = file_pattern
-- 	local keymaps = {}
--
-- 	if opts ~= nil then
-- 		-- check for custom pattern
-- 		if opts.pattern then
-- 			pattern = opts.pattern
-- 		end
--
-- 		-- if opts is a string
-- 		if type(opts) == "string" then
-- 			if opts == "auto" then
-- 				target_table = autosnippets
-- 			else
-- 				table.insert(keymaps, { "i", opts })
-- 			end
-- 		end
--
-- 		-- if opts is a table
-- 		if opts ~= nil and type(opts) == "table" then
-- 			for _, keymap in ipairs(opts) do
-- 				if type(keymap) == "string" then
-- 					table.insert(keymaps, { "i", keymap })
-- 				else
-- 					table.insert(keymaps, keymap)
-- 				end
-- 			end
-- 		end
--
-- 		-- set autocmd for each keymap
-- 		if opts ~= "auto" then
-- 			for _, keymap in ipairs(keymaps) do
-- 				vim.api.nvim_create_autocmd("BufEnter", {
-- 					pattern = pattern,
-- 					group = group,
-- 					callback = function()
-- 						vim.keymap.set(keymap[1], keymap[2], function()
-- 							ls.snip_expand(snippet)
-- 						end, { noremap = true, silent = true, buffer = true })
-- 					end,
-- 				})
-- 			end
-- 		end
-- 	end
--
-- 	table.insert(target_table, snippet) -- insert snippet into appropriate table
-- end --}}}





local snips = {
    s(
        "sn",
        fmta(
        --========
            [[
            s(
                "<1>",
            <5>(
                --===== <2> =====
                <3>
                <6>
                <4>,
                --===============
                {
                    <7>
                }
            )
            ),
            ]],
            --========
            {
                i(1, "prefix"), -- 1
                rep(1), -- 2
                t("[["), -- 3
                t("]]"), -- 4
                c(2, -- 5
                    {
                        i(nil, "fmt"),
                        i(nil, "fmta"),
                    }
                ),
                i(3, "body here"), -- 6
                i(4, "args"), -- 7
            },
            {
                trim_empty = false,
            }
        )
    ),
    -- TODO:config with this
    s(
        "rq",
        fmt('local {} = require("{}")', {
            l(l._1:match("[^./]*$"), 1),
            -- l(l._1:match("[^.]*$"):gsub("[^%a]+", "-"), 1),
            i(1, "module"),
        })
    ),
    parse("lm",            "local M = {}\n\nfunction M.setup()\n  $1 \nend\n\nreturn M"),
    parse("cmd",           "<CMD>$1<CR>"),
    parse("pa",            [[parse("$1", "$2")]]),
    parse("formatEnable", "---@format enable"),
    parse("formatDisable", "---@format disable"),
    -- s("auto-", fmt([[s("{}", {})]], {i(1, 'trigger'), i(2, "")} ))
}



-- End Snippets --
return snips
