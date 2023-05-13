local plugins = util.list()
local keys = {
    { '<leader>ek',    '<Cmd>DapStepOver<CR>',                              desc = 'Step Over' },
    { '<leader>es',    '<Cmd>DapStepInto<CR>',                              desc = 'Step Into' },
    { '<leader>eo',    '<Cmd>DapStepOut<CR>',                               desc = 'Step Out' },
    { '<leader>er',    '<Cmd>DapToggleRepl<CR>',                            desc = 'Toggle Repl' },
    { '<leader>ee',    '<Cmd>DapToggleBreakpoint<CR>',                      desc = 'Toggle Breakpoint' },
    { '<leader>e<Cr>', function() require 'osv'.run_this() end,             desc = 'Start To Debug' },
    { '<leader>en',    function() require 'osv'.launch { port = 8086 } end, desc = 'Start To Debug' },
    { '<leader>ei',    function() require 'dap'.step_back() end,            desc = 'Step Back' },
    { '<leader>eh',    function() require 'dap'.run_to_cursor() end,        desc = 'Run to Cursor' },
    -- { '<leader>eq',    function() require 'dap'.terminate() end,            desc = 'Quit' },
    { '<leader>eg',    function() require 'dap'.session() end,              desc = 'Get Session' },
    { '<leader>ec',    function() require 'dap'.continue() end,             desc = 'Continue' },
    { '<leader>ep',    function() require 'dap'.pause.toggle() end,         desc = 'Pause' },
    { '<leader>eh',    function() require 'dap.ui.widgets'.hover() end,     desc = 'Hover' },
    { '<leader>eu',    function() require 'dap.ui.widgets'.preview() end,   desc = 'Preview' },
    -- { '<leader>e<Cr>', function() require 'osv'.run_this() end,             desc = 'Start To Debug' },
    -- { '<leader>en',    function() require 'osv'.launch { port = 8086 } end, desc = 'Start To Debug' },
    { '<leader>eq',    function() require 'dap'.close() end,                desc = 'Quit' },
}

local config = function()
    local fn = vim.fn
    local dap_breakpoint_color = {
        breakpoint = {
            ctermbg = 0,
            fg = '#993939',
            bg = '#31353f',
        },
        logpoing = {
            ctermbg = 0,
            fg = '#61afef',
            bg = '#31353f',
        },
        stopped = {
            ctermbg = 0,
            fg = '#98c379',
            bg = '#31353f',
        },
    }

    vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
    vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
    vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)
    local dap_breakpoint = {
        error = {
            text = '',
            texthl = 'DapBreakpoint',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        },
        condition = {
            text = 'ﳁ',
            texthl = 'DapBreakpoint',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        },
        rejected = {
            text = '',
            texthl = 'DapBreakpint',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        },
        logpoint = {
            text = '',
            texthl = 'DapLogPoint',
            linehl = 'DapLogPoint',
            numhl = 'DapLogPoint',
        },
        stopped = {
            text = '',
            texthl = 'DapStopped',
            linehl = 'DapStopped',
            numhl = 'DapStopped',
        },
    }
    fn.sign_define('DapBreakpoint', dap_breakpoint.error)
    fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
    fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
    fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
    fn.sign_define('DapStopped', dap_breakpoint.stopped)



    local dap, dapui = require 'dap', require 'dapui'
    dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
    end

    dap.listeners.before.event_terminated['dapui_config'] = function()
        print 'close'
        dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
    end
end

plugins:add {
    'rcarriga/nvim-dap-ui',
    opts = {
    },
}

plugins:add {
    'jayp0521/mason-nvim-dap.nvim',
    cmd = 'DAPInstall',
    opts = {
        automatic_setup = true,
        handlers = {
            function(conf)
                require 'mason-nvim-dap'.default_setup(conf)
            end,
        },
    },
}

plugins:add {
    'theHamsta/nvim-dap-virtual-text',
    opts = {
        enabled = true,
        enable_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        filter_references_pattern = '<module',
        virt_text_pos = 'eol',
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil,
    },
}

plugins:add {
    'LiadOz/nvim-dap-repl-highlights',
    build = 'TSInstall dap_repl',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {
    },
}



return {
    'mfussenegger/nvim-dap',
    config = config,
    dependencies = plugins,
    keys = keys,
}
