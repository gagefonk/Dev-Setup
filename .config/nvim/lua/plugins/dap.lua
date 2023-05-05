local M = {
    'mfussenegger/nvim-dap',
    lazy = false,
    enabled = true,
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-telescope/telescope-dap.nvim',
        'folke/neodev.nvim',
    },
}

M.keys = {
    { '<leader>db', '<cmd>lua require "dap".toggle_breakpoint()<cr>', desc = 'Breakpoint' },
    { '<leader>dc', '<cmd>lua require "dap".continue()<cr>', desc = 'Continue' },
    { '<leader>di', '<cmd>lua require "dap".step_into()<cr>', desc = 'Into' },
    { '<leader>do', '<cmd>lua require "dap".step_over()<cr>', desc = 'Over' },
    { '<leader>dO', '<cmd>lua require "dap".step_out()<cr>', desc = 'Out' },
    { '<leader>dr', '<cmd>lua require "dap".repl.toggle()<cr>', desc = 'Repl' },
    { '<leader>dl', '<cmd>lua require "dap".run_last()<cr>', desc = 'Last' },
    { '<leader>dx', '<cmd>lua require "dap".terminate()<cr>', desc = 'Exit' },
    { '<leader>du', '<cmd>lua require "dapui".toggle()<cr>', desc = 'UI' },
}

M.config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local virtual_text = require 'nvim-dap-virtual-text'
    local dap_go = require 'dap-go'

    dap.adapters.lldb = {
        type = 'executable',
        command = '/opt/homebrew/opt/llvm/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
    }

    local lldb = {
        name = 'Launch lldb',
        type = 'lldb', -- matches the adapter
        request = 'launch', -- could also attach to a currently running process
        program = function()
            return vim.fn.input(
                'Path to executable: ',
                vim.fn.getcwd() .. '/',
                'file'
            )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
    }

    dap.configurations.rust = {
        lldb
    }

    dapui.setup()
    virtual_text.setup()
    dap_go.setup()
end

return M