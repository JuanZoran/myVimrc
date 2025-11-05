return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    -- toggle = { enabled = true },

    dashboard = require'plugins.tools.snack.dashboard',
    picker = require'plugins.tools.snack.picker',

    indent = { enabled = true },
    input = { enabled = true },
    -- scroll = { enabled = true },
    statuscolumn = { enabled = true },

    -- explorer = { enabled = true },
    -- scope = { enabled = true },
    -- words = { enabled = true },


    -- NOTE : noice has done these
    -- notify = { enabled = true },
    -- notifier = { enabled = true },
  },
}
