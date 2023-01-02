-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/zoran/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/zoran/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/zoran/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/zoran/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/zoran/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["SmoothCursor.nvim"] = {
    config = { 'require "plugins.ui.SmoothCursor"' },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/SmoothCursor.nvim",
    url = "https://github.com/gen740/SmoothCursor.nvim"
  },
  Trans = {
    config = { "\27LJ\2\nø\1\0\0\6\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\a\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\tdesc\18ïž¾ Translate!<Cmd>TranslateCursorWord<CR>\6n\1\0\1\tdesc\18ïž¾ Translate&<Esc><Cmd>TranslateSelectWord<CR>\amm\6v\bset\vkeymap\bvim\nsetup\nTrans\frequire\0" },
    keys = { { "v", "mm" }, { "n", "mm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/Trans",
    url = "/home/zoran/project/Neovim/Trans"
  },
  ["alpha-nvim"] = {
    config = { 'require("plugins.ui.alpha")' },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cinnamon.nvim"] = {
    config = { 'require("plugins.ui.smooth")' },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/cinnamon.nvim",
    url = "https://github.com/declancm/cinnamon.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    after_files = { "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-rg/after/plugin/cmp-rg.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-tabnine"] = {
    after_files = { "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/after/plugin/cmp-tabnine.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  cmp_luasnip = {
    after_files = { "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["comment.nvim"] = {
    config = { "require'plugins.tools.comment'" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/comment.nvim",
    url = "https://github.com/numtostr/comment.nvim"
  },
  everforest = {
    config = { "require 'plugins.ui.theme.everforest'" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["filetype.nvim"] = {
    config = { " require 'plugins.base.filetype' " },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  firenvim = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["github-nvim-theme"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require 'plugins.lang.indent'" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "require 'plugins.ui.theme.kanagawa'" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n•\4\0\1\21\0\19\1A6\1\0\0004\3\6\0005\4\2\0005\5\1\0>\5\1\4>\4\1\0035\4\4\0005\5\3\0>\5\1\4>\4\2\0035\4\6\0005\5\5\0>\5\1\4>\4\3\0035\4\b\0005\5\a\0>\5\1\4>\4\4\0035\4\n\0005\5\t\0>\5\1\4>\4\5\3B\1\2\4X\4%€\18\6\5\0:\a\1\6:\b\2\6:\t\3\0066\n\0\0\18\f\a\0B\n\2\4X\r\27€\14\0\0\0X\15\16€6\15\v\0009\15\f\0159\15\r\15\18\17\b\0\18\18\14\0B\15\3\2\a\15\14\0X\15\17€6\15\v\0009\15\f\0159\15\15\15\18\17\t\0\18\18\14\0B\15\3\2\t\15\0\0X\15\t€6\15\v\0009\15\16\0159\15\17\15\18\17\14\0\18\18\b\0\18\19\t\0005\20\18\0B\15\5\1X\15\0€E\r\3\3R\rã\127E\4\3\3R\4Ù\127+\1\0\0L\1\2\0\1\0\1\vsilent\2\bset\vkeymap\rhasmapto\5\rmapcheck\afn\bvim\1\4\0\0\0\ags\30<Plug>(leap-cross-window)\1\4\0\0\6n\6x\6o\1\4\0\0\0\6X\31<Plug>(leap-backward-till)\1\3\0\0\6x\6o\1\4\0\0\0\6x\30<Plug>(leap-forward-till)\1\3\0\0\6x\6o\1\4\0\0\0\6S\29<Plug>(leap-backward-to)\1\4\0\0\6n\6x\6o\1\4\0\0\0\6s\28<Plug>(leap-forward-to)\1\4\0\0\6n\6x\6o\vipairs\0\0" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  luasnip = {
    after = { "cmp_luasnip" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nsnips\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/luasnip",
    url = "https://github.com/L3mon4d3/luasnip"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    config = { "require 'plugins.ui.theme.material'" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/muniftanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("conf.autopairs")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "luasnip", "cmp-nvim-lua", "cmp-tabnine", "cmp-buffer", "cmp-cmdline", "cmp-path", "cmp-rg" },
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rconf.cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nÙ\1\0\0\6\0\f\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\0016\0\5\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\1K\0\1\0\1\0\1\tdesc\24[]Clipboard History\31<cmd>Telescope neoclip<cr>\15<leader>tg\6n\bset\vkeymap\bvim\19load_extension\14telescope\nsetup\fneoclip\frequire\0" },
    keys = { { "n", "<leader>tg" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-toggler"] = {
    config = { "require'plugins.tools.toggle'" },
    keys = { { "n", "<Leader>u" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-toggler",
    url = "https://github.com/nguyenvukhang/nvim-toggler"
  },
  ["nvim-tree.lua"] = {
    config = { 'require"conf.nvim_tree"' },
    keys = { { "", "n" }, { "", "ww" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-trevJ.lua"] = {
    config = { "\27LJ\2\n¤\1\0\0\a\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0005\6\t\0B\1\5\1K\0\1\0\1\0\1\tdesc\28[]Open Format At Cursor\21format_at_cursor\15<leader>ff\6n\bset\vkeymap\bvim\nsetup\ntrevj\frequire\0" },
    keys = { { "n", "<leader>ff" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-trevJ.lua",
    url = "https://github.com/AckslD/nvim-trevJ.lua"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-ufo"] = {
    config = { 'require "conf.ufo"' },
    keys = { { "n", "zR" }, { "n", "zM" }, { "v", "za" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persisted.nvim"] = {
    config = { "require 'plugins.tools.session'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/persisted.nvim",
    url = "https://github.com/olimorris/persisted.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18conf.refactor\frequire\0" },
    keys = { { "v", "<Leader>rr" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nœ\1\0\0\5\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0 <cmd>Telescope frecency<cr>\n<C-y>\6n\bset\vkeymap\bvim\rfrecency\19load_extension\14telescope\frequire\0" },
    keys = { { "n", "<C-y>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-harpoon.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17conf.harpoon\frequire\0" },
    keys = { { "n", "<Leader>hh" }, { "n", "<Leader>hi" }, { "n", "<Leader>hj" }, { "n", "<Leader>hl" }, { "n", "<Leader>hc" }, { "n", "<Leader>hm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-harpoon.nvim",
    url = "https://github.com/brandoncc/telescope-harpoon.nvim"
  },
  ["telescope-project.nvim"] = {
    config = { "\27LJ\2\n’\1\0\0\6\0\n\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0009\5\3\0059\5\3\5B\1\4\1K\0\1\0\15extensions\n<C-p>\6n\bset\vkeymap\bvim\fproject\19load_extension\14telescope\frequire\0" },
    keys = { { "n", "<C-p>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope-zoxide"] = {
    config = { "\27LJ\2\nÈ\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\tdesc\30îž€ Cd recently directory#<cmd>Telescope zoxide list<cr>\15<leader>cd\6n\bset\vkeymap\bvim\vzoxide\19load_extension\14telescope\frequire\0" },
    keys = { { "n", "<leader>cd" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'require"plugins.tools.toggleterm"' },
    keys = { { "n", "<C-d>" }, { "n", "<C-g>" }, { "i", "<C-g>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["twilight.nvim"] = {
    config = { "require 'plugins.tools.zen'" },
    keys = { { "n", "<leader><leader>h" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\nm\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc\18ï±“ EasyAlign\22<Plug>(EasyAlign)\14<leader>=\5\bset\vkeymap\bvim\0" },
    keys = { { "", "<Leader>=" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/rrethy/vim-illuminate"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["which-key.nvim"] = {
    config = { ' require "plugins.tools.which-key" ' },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^persisted"] = "persisted.nvim",
  ["^telescope%._extensions%.zoxide"] = "telescope-zoxide"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\n•\4\0\1\21\0\19\1A6\1\0\0004\3\6\0005\4\2\0005\5\1\0>\5\1\4>\4\1\0035\4\4\0005\5\3\0>\5\1\4>\4\2\0035\4\6\0005\5\5\0>\5\1\4>\4\3\0035\4\b\0005\5\a\0>\5\1\4>\4\4\0035\4\n\0005\5\t\0>\5\1\4>\4\5\3B\1\2\4X\4%€\18\6\5\0:\a\1\6:\b\2\6:\t\3\0066\n\0\0\18\f\a\0B\n\2\4X\r\27€\14\0\0\0X\15\16€6\15\v\0009\15\f\0159\15\r\15\18\17\b\0\18\18\14\0B\15\3\2\a\15\14\0X\15\17€6\15\v\0009\15\f\0159\15\15\15\18\17\t\0\18\18\14\0B\15\3\2\t\15\0\0X\15\t€6\15\v\0009\15\16\0159\15\17\15\18\17\14\0\18\18\b\0\18\19\t\0005\20\18\0B\15\5\1X\15\0€E\r\3\3R\rã\127E\4\3\3R\4Ù\127+\1\0\0L\1\2\0\1\0\1\vsilent\2\bset\vkeymap\rhasmapto\5\rmapcheck\afn\bvim\1\4\0\0\0\ags\30<Plug>(leap-cross-window)\1\4\0\0\6n\6x\6o\1\4\0\0\0\6X\31<Plug>(leap-backward-till)\1\3\0\0\6x\6o\1\4\0\0\0\6x\30<Plug>(leap-forward-till)\1\3\0\0\6x\6o\1\4\0\0\0\6S\29<Plug>(leap-backward-to)\1\4\0\0\6n\6x\6o\1\4\0\0\0\6s\28<Plug>(leap-forward-to)\1\4\0\0\6n\6x\6o\vipairs\0\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require("plugins.ui.alpha")
time([[Config for alpha-nvim]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
require 'plugins.ui.theme.kanagawa'
time([[Config for kanagawa.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require 'plugins.lang.indent'
time([[Config for indent-blankline.nvim]], false)
-- Config for: comment.nvim
time([[Config for comment.nvim]], true)
require'plugins.tools.comment'
time([[Config for comment.nvim]], false)
-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
require("plugins.ui.smooth")
time([[Config for cinnamon.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
 require "plugins.tools.which-key" 
time([[Config for which-key.nvim]], false)
-- Config for: SmoothCursor.nvim
time([[Config for SmoothCursor.nvim]], true)
require "plugins.ui.SmoothCursor"
time([[Config for SmoothCursor.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
 require 'plugins.base.filetype' 
time([[Config for filetype.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope' }, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ColorizerToggle', function(cmdargs)
          require('packer.load')({'nvim-colorizer.lua'}, { cmd = 'ColorizerToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-colorizer.lua'}, { cmd = 'ColorizerToggle' }, _G.packer_plugins)
          return vim.fn.getcompletion('ColorizerToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'StartupTime', function(cmdargs)
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime' }, _G.packer_plugins)
          return vim.fn.getcompletion('StartupTime ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[vnoremap <silent> mm <cmd>lua require("packer.load")({'Trans'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-p> <cmd>lua require("packer.load")({'telescope-project.nvim'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>tg <cmd>lua require("packer.load")({'nvim-neoclip.lua'}, { keys = "<lt>leader>tg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ww <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "ww", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>ff <cmd>lua require("packer.load")({'nvim-trevJ.lua'}, { keys = "<lt>leader>ff", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-g> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>C-g>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-g> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>C-g>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-d> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>C-d>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader><leader>h <cmd>lua require("packer.load")({'twilight.nvim'}, { keys = "<lt>leader><lt>leader>h", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hh <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hh", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>cd <cmd>lua require("packer.load")({'telescope-zoxide'}, { keys = "<lt>leader>cd", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>u <cmd>lua require("packer.load")({'nvim-toggler'}, { keys = "<lt>Leader>u", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hc <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hl <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hi <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hj <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hj", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> mm <cmd>lua require("packer.load")({'Trans'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hm <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>= <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Leader>=", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> zR <cmd>lua require("packer.load")({'nvim-ufo'}, { keys = "zR", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-y> <cmd>lua require("packer.load")({'telescope-frecency.nvim'}, { keys = "<lt>C-y>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <Leader>rr <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "<lt>Leader>rr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> zM <cmd>lua require("packer.load")({'nvim-ufo'}, { keys = "zM", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> za <cmd>lua require("packer.load")({'nvim-ufo'}, { keys = "za", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "md" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au insertenter * ++once lua require("packer.load")({'nvim-cmp', 'luasnip'}, { event = "insertenter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au cmdlineenter * ++once lua require("packer.load")({'nvim-cmp', 'luasnip'}, { event = "cmdlineenter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
