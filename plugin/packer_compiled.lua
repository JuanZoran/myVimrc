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
local should_profile = true
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
  ["T.vim"] = {
    config = { "\27LJ\2\n≠\1\0\0\5\0\b\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\6\0'\3\4\0'\4\a\0B\0\4\1K\0\1\0,<cmd>call T#Main(expand('<cword>'))<cr>\6n0:<c-u>call T#VisualSearch(visualmode())<cr>\amm\6v\bset\vkeymap\bvim\0" },
    keys = { { "v", "mm" }, { "n", "mm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/T.vim",
    url = "https://github.com/sicong-li/T.vim"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["bufferline.nvim"] = {
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
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
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
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["comment.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/comment.nvim",
    url = "https://github.com/numtostr/comment.nvim"
  },
  everforest = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["filetype.nvim"] = {
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
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
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
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["limelight.vim"] = {
    config = { 'require("conf.zen")' },
    keys = { { "", "n" }, { "", "<leader><leader>h" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
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
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nsnips\frequire\0" },
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/luasnip",
    url = "https://github.com/l3mon4d3/luasnip"
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
    after = { "cmp-tabnine", "cmp-path", "cmp-buffer", "cmp-cmdline", "cmp-nvim-lsp", "cmp-nvim-lua", "cmp_luasnip" },
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
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/smiteshp/nvim-navic"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n—\1\0\0\6\0\f\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\0016\0\5\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\1K\0\1\0\1\0\1\tdesc\16Powerful cd\31<cmd>Telescope neoclip<cr>\15<leader>tg\6n\bset\vkeymap\bvim\19load_extension\14telescope\nsetup\fneoclip\frequire\0" },
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
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16conf.toggle\frequire\0" },
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
  ["nvim-treehopper"] = {
    config = { "\27LJ\2\nΩ\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vsilent\2%:lua require('tsht').nodes()<CR>\6x\1\0\1\vsilent\2*:<C-U>lua require('tsht').nodes()<CR>\6m\6o\bset\vkeymap\bvim\0" },
    keys = { { "x", "m" }, { "o", "m" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/nvim-treehopper",
    url = "https://github.com/mfussenegger/nvim-treehopper"
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
    config = { "\27LJ\2\n§\1\0\0\a\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0005\6\t\0B\1\5\1K\0\1\0\1\0\1\tdesc\28[]Open Format At Cursor\21format_at_cursor\15<leader>ff\6n\bset\vkeymap\bvim\nsetup\ntrevj\frequire\0" },
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
  ["session-lens"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\n∆\1\0\0\5\0\f\0\0186\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0'\2\6\0B\0\2\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0B\0\4\1K\0\1\0 <cmd>Telescope frecency<cr>\n<C-y>\6n\bset\vkeymap\rfrecency\19load_extension\14telescope\frequire\26PackerLoad sqlite.lua\bcmd\bvim\0" },
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
    config = { "\27LJ\2\ní\1\0\0\6\0\n\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0009\5\t\0009\5\3\0059\5\3\5B\1\4\1K\0\1\0\15extensions\n<C-p>\6n\bset\vkeymap\bvim\fproject\19load_extension\14telescope\frequire\0" },
    keys = { { "n", "<C-p>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
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
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\2\nm\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc\18Ô±ì EasyAlign\22<Plug>(EasyAlign)\14<leader>=\5\bset\vkeymap\bvim\0" },
    keys = { { "", "<Leader>=" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/opt/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
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
    loaded = true,
    path = "/home/zoran/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
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

-- Config for: luasnip
time([[Config for luasnip]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nsnips\frequire\0", "config", "luasnip")
time([[Config for luasnip]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
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
vim.cmd [[nnoremap <silent> <C-y> <cmd>lua require("packer.load")({'telescope-frecency.nvim'}, { keys = "<lt>C-y>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> mm <cmd>lua require("packer.load")({'T.vim'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'limelight.vim'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> zM <cmd>lua require("packer.load")({'nvim-ufo'}, { keys = "zM", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> zR <cmd>lua require("packer.load")({'nvim-ufo'}, { keys = "zR", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>ff <cmd>lua require("packer.load")({'nvim-trevJ.lua'}, { keys = "<lt>leader>ff", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> <Leader>rr <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "<lt>Leader>rr", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[onoremap <silent> m <cmd>lua require("packer.load")({'nvim-treehopper'}, { keys = "m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> mm <cmd>lua require("packer.load")({'T.vim'}, { keys = "mm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[vnoremap <silent> za <cmd>lua require("packer.load")({'nvim-ufo'}, { keys = "za", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Leader>= <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Leader>=", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hm <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hl <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[xnoremap <silent> m <cmd>lua require("packer.load")({'nvim-treehopper'}, { keys = "m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <C-p> <cmd>lua require("packer.load")({'telescope-project.nvim'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>tg <cmd>lua require("packer.load")({'nvim-neoclip.lua'}, { keys = "<lt>leader>tg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hc <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ww <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "ww", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>u <cmd>lua require("packer.load")({'nvim-toggler'}, { keys = "<lt>Leader>u", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hj <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hj", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <leader>cd <cmd>lua require("packer.load")({'telescope-zoxide'}, { keys = "<lt>leader>cd", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader><leader>h <cmd>lua require("packer.load")({'limelight.vim'}, { keys = "<lt>leader><lt>leader>h", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hi <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hi", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> <Leader>hh <cmd>lua require("packer.load")({'telescope-harpoon.nvim'}, { keys = "<lt>Leader>hh", prefix = "" }, _G.packer_plugins)<cr>]]
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
vim.cmd [[au cmdlineenter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "cmdlineenter *" }, _G.packer_plugins)]]
vim.cmd [[au insertenter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "insertenter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles(0) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
