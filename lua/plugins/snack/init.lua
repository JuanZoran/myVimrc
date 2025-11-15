return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    -- toggle = { enabled = true },
    dashboard = require'plugins.snack.dashboard',
    picker = require'plugins.snack.picker',
    indent = { enabled = true },
    input = { enabled = true },
    -- scroll = { enabled = true },
    statuscolumn = { enabled = true },
  },
}
