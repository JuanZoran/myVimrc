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
    config = { "require 'plugins.ui.smooth'" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/SmoothCursor.nvim",
    url = "https://github.com/gen740/SmoothCursor.nvim"
  },
  Trans = {
    config = { "\27LJ\2\n¯\1\0\0\6\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\tdesc\29Ôûæ Translate From Input\28<Cmd>TranslateInput<CR>\ami\6n\1\0\1\tdesc\18Ôûæ Translate\23<Cmd>Translate<CR>\amm\1\3\0\0\6v\6n\bset\vkeymap\bvim\nsetup\nTrans\frequire\0" },
    keys = { { "v", "mm" }, { "n", "mm" }, { "n", "mi" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/Trans",
    url = "/home/zoran/project/Neovim/Trans"
  },
  ["align.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/align.nvim",
    url = "https://github.com/Vonr/align.nvim"
  },
  ["alpha-nvim"] = {
    config = { 'require("plugins.ui.alpha")' },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { 'require "plugins.ui.bufferline"' },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cinnamon.nvim"] = {
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
  firenvim = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["flit.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/flit.nvim",
    url = "https://github.com/ggandor/flit.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["github-nvim-theme"] = {
    config = { "require 'plugins.ui.theme.github'" },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "require 'plugins.tools.gitsigns'" },
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
    config = { "require 'plugins.tools.leap'" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require "plugins.ui.lualine"' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
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
  ["mason-nvim-dap.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/mason-nvim-dap.nvim",
    url = "https://github.com/jayp0521/mason-nvim-dap.nvim"
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
  ["neodev.nvim"] = {
    config = { "\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\flibrary\1\0\0\1\0\1\fplugins\1\nsetup\vneodev\frequire\0" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["noice.nvim"] = {
    config = { 'require "plugins.ui.noice"' },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/muniftanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require "plugins.tools.autopairs"' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "luasnip", "cmp-tabnine", "cmp-cmdline", "cmp-buffer", "cmp-path" },
    config = { 'require "plugins.lang.cmp"' },
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
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "require 'plugins.telescope.neoclip'" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { 'require "plugins.ui.notify"' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { 'require "plugins.ui.nvim_tree"' },
    keys = { { "", "n" }, { "", "ww" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("plugins.lang.treesitter")' },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-trevJ.lua"] = {
    config = { "\27LJ\2\n¶\1\0\0\a\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0005\6\t\0B\1\5\1K\0\1\0\1\0\1\tdesc\30Ôù° Open Format At Cursor\21format_at_cursor\15<leader>ff\6n\bset\vkeymap\bvim\nsetup\ntrevj\frequire\0" },
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
    config = { "require 'plugins.lang.ufo'" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-ufo",
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
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/persisted.nvim",
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
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["refactoring.nvim"] = {
    config = { "require 'plugins.telescope.refactor'" },
    keys = { { "v", "<Leader>rr" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  sniprun = {
    config = { 'require("plugins.lang.sniprun")' },
    keys = { { "n", "<leader><C-r>" }, { "v", "<C-r>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  ["specs.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/specs.nvim",
    url = "https://github.com/edluffy/specs.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-harpoon.nvim"] = {
    config = { "require 'plugins.telescope.harpoon'" },
    keys = { { "n", "<Leader>hh" }, { "n", "<Leader>hi" }, { "n", "<Leader>hj" }, { "n", "<Leader>hl" }, { "n", "<Leader>hc" }, { "n", "<Leader>hm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-harpoon.nvim",
    url = "https://github.com/brandoncc/telescope-harpoon.nvim"
  },
  ["telescope-project.nvim"] = {
    config = { "\27LJ\2\ní\1\0\0\6\0\n\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0009\5\3\0059\5\3\5B\1\4\1K\0\1\0\15extensions\n<C-p>\6n\bset\vkeymap\bvim\fproject\19load_extension\14telescope\frequire\0" },
    keys = { { "n", "<C-p>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    config = { "\27LJ\2\n}\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc\23ü§†Search Symbols\31<cmd>Telescope symbols<cr>\15<leader>tm\6n\bset\vkeymap\bvim\0" },
    keys = { { "", "n" }, { "", "<leader>tm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope-undo.nvim"] = {
    config = { "\27LJ\2\nœ\2\0\0\n\0\23\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\v\0005\4\t\0005\5\a\0005\6\5\0006\a\0\0'\t\3\0B\a\2\0029\a\4\a=\a\6\6=\6\b\5=\5\n\4=\4\f\3=\3\14\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\15\0'\2\f\0B\0\2\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\20\0'\4\21\0005\5\22\0B\0\5\1K\0\1\0\1\0\1\tdesc\19[]Undo History\28<cmd>Telescope undo<cr>\15<leader>tu\6n\bset\vkeymap\bvim\19load_extension\15extensions\1\0\0\tundo\1\0\0\rmappings\1\0\0\6i\1\0\0\t<CR>\1\0\0\frestore\27telescope-undo.actions\nsetup\14telescope\frequire\0" },
    keys = { { "", "n" }, { "", "<leader>tu" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-undo.nvim",
    url = "https://github.com/debugloop/telescope-undo.nvim"
  },
  ["telescope-zoxide"] = {
    config = { "\27LJ\2\n»\1\0\0\6\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\1K\0\1\0\1\0\1\tdesc\30ÓûÄ Cd recently directory#<cmd>Telescope zoxide list<cr>\15<leader>cd\6n\bset\vkeymap\bvim\vzoxide\19load_extension\14telescope\frequire\0" },
    keys = { { "n", "<leader>cd" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    config = { "require 'plugins.telescope.base'" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "require 'plugins.tools.todo-comments'" },
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
  ["ts-node-action"] = {
    config = { "require'plugins.tools.toggle'" },
    keys = { { "n", "<leader>u" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/ts-node-action",
    url = "https://github.com/CKolkey/ts-node-action"
  },
  ["twilight.nvim"] = {
    load_after = {
      ["zen-mode.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
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
  },
  ["zen-mode.nvim"] = {
    after = { "twilight.nvim" },
    config = { "require 'plugins.tools.zen'" },
    keys = { { "n", "<leader><leader>h" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^align"] = "align.nvim",
  ["^firenvim"] = "firenvim",
  ["^notify"] = "nvim-notify",
  ["^nui"] = "nui.nvim",
  ["^promise"] = "promise-async"
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

-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("plugins.lang.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require("plugins.ui.alpha")
time([[Config for alpha-nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require 'plugins.telescope.base'
time([[Config for telescope.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
require 'plugins.lang.ufo'
time([[Config for nvim-ufo]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require 'plugins.tools.gitsigns'
time([[Config for gitsigns.nvim]], false)
-- Config for: neodev.nvim
time([[Config for neodev.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\flibrary\1\0\0\1\0\1\fplugins\1\nsetup\vneodev\frequire\0", "config", "neodev.nvim")
time([[Config for neodev.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
 require "plugins.tools.which-key" 
time([[Config for which-key.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require 'plugins.tools.todo-comments'
time([[Config for todo-comments.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
require "plugins.ui.noice"
time([[Config for noice.nvim]], false)
-- Config for: comment.nvim
time([[Config for comment.nvim]], true)
require'plugins.tools.comment'
time([[Config for comment.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require "plugins.ui.bufferline"
time([[Config for bufferline.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
require 'plugins.tools.leap'
time([[Config for leap.nvim]], false)
-- Config for: persisted.nvim
time([[Config for persisted.nvim]], true)
require 'plugins.tools.session'
time([[Config for persisted.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
require 'plugins.telescope.neoclip'
time([[Config for nvim-neoclip.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require 'plugins.lang.indent'
time([[Config for indent-blankline.nvim]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
require 'plugins.ui.theme.kanagawa'
time([[Config for kanagawa.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'StartupTime', function(cmdargs)
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-startuptime'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('StartupTime ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'ColorizerToggle', function(cmdargs)
          require('packer.load')({'nvim-colorizer.lua'}, { cmd = 'ColorizerToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-colorizer.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ColorizerToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[vnoremap <silent> mm <cmd>lua require("packer.load")({'Trans'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hi <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <Leader>rr <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "<lt>Leader>rr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hh <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hh", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ww <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "ww", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>tu <cmd>lua require("packer.load")({'telescope-undo.nvim'}, { keys = "<lt>leader>tu", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hc <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> mm <cmd>lua require("packer.load")({'Trans'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-g> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>C-g>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <C-r> <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>C-r>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> mi <cmd>lua require("packer.load")({'Trans'}, { keys = "mi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-p> <cmd>lua require("packer.load")({'telescope-project.nvim'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'telescope-symbols.nvim'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[inoremap <silent> <C-g> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>C-g>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hm <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>cd <cmd>lua require("packer.load")({'telescope-zoxide'}, { keys = "<lt>leader>cd", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader><leader>h <cmd>lua require("packer.load")({'zen-mode.nvim'}, { keys = "<lt>leader><lt>leader>h", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>ff <cmd>lua require("packer.load")({'nvim-trevJ.lua'}, { keys = "<lt>leader>ff", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>tm <cmd>lua require("packer.load")({'telescope-symbols.nvim'}, { keys = "<lt>leader>tm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-d> <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>C-d>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'telescope-undo.nvim'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hl <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hj <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hj", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader><C-r> <cmd>lua require("packer.load")({'sniprun'}, { keys = "<lt>leader><lt>C-r>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>u <cmd>lua require("packer.load")({'ts-node-action'}, { keys = "<lt>leader>u", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType md ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au insertenter * ++once lua require("packer.load")({'luasnip', 'nvim-cmp'}, { event = "insertenter *" }, _G.packer_plugins)]]
vim.cmd [[au cmdlineenter * ++once lua require("packer.load")({'luasnip', 'nvim-cmp'}, { event = "cmdlineenter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'lualine.nvim', 'SmoothCursor.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
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
