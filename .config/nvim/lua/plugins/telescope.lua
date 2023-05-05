local M = {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = false,
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'jvgrootveld/telescope-zoxide',
        'nvim-tree/nvim-web-devicons',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
        'telescope-dap.nvim'
    },
}

M.keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help' },
    { '<leader>fH', '<cmd>Telescope highlights<cr>', desc = 'Find highlight groups' },
    { '<leader>fM', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Open Recent File' },
    { '<leader>fR', '<cmd>Telescope registers<cr>', desc = 'Registers' },
    { '<leader>fa', '<cmd>Telescope live_grep<cr>', desc = 'Find All' },
    { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
    { '<leader>fC', '<cmd>Telescope commands<cr>', desc = 'Commands' },
    { '<leader>fl', '<cmd>Telescope resume<cr>', desc = 'Resume last search' },
    { '<leader>fc', '<cmd>Telescope git_commits<cr>', desc = 'Git Commits' },
    { '<leader>fb', '<cmd>Telescope git_branches<cr>', desc = 'Git Branches' },
    { '<leader>fs', '<cmd>Telescope git_status<cr>', desc = 'Git Status' },
    { '<leader>fS', '<cmd>Telescope git_stash<cr>', desc = 'Git Stash' },
    { '<leader>fdt', '<cmd>Telescope diagnostics<cr>', desc = 'Find Diagnostics' },
    { '<leader>fdc', '<cmd>Telescope dap commands<cr>', desc = 'Dap Commands' },
    { '<leader>fdb', '<cmd>Telescope dap list_breakpoints<cr>', desc = ' Dap Breakpoints' },
    { '<leader>fdg', '<cmd>Telescope dap configurations', desc = 'Dap Configuration' },
    { '<Leader>fdv', '<cmd>Telescope dap variables<cr>', desc = 'Dap Variables' },
    { '<leader>fdf', '<cmd>Telescope dap frames<cr>', desc = 'Dap frames' },
}

-- M.opts =

M.config = function()
    local telescope = require 'telescope'
    telescope.setup({
        defaults   = {
            theme                = 'dropdown',
            previewer            = true,
            file_ignore_patterns = { 'node_modules', 'package-lock.json' },
            initial_mode         = 'insert',
            select_strategy      = 'reset',
            sorting_strategy     = 'ascending',
            layout_strategy      = 'horizontal',
            layout_config        = {
                width = 0.75,
                height = 0.75,
                prompt_position = 'top',
                preview_cutoff = 120,
            },
            path_display         = { 'truncate' },
            winblend             = 0,
            border               = {},
            borderchars          = nil,
            color_devicons       = true,
            set_env              = { ['COLORTERM'] = 'truecolor' },
            vimgrep_arguments    = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--hidden',
                '--glob=!.git/',
            },
        },
        pickers    = {
            find_files = {
                hidden = true,
                previewer = true,
                layout_config = {
                    horizontal = {
                        width = 0.5,
                        height = 0.4,
                        preview_width = 0.6,
                    },
                },
            },
            git_files = {
                hidden = true,
                previewer = true,
                layout_config = {
                    horizontal = {
                        width = 0.5,
                        height = 0.4,
                        preview_width = 0.6,
                    },
                },
            },
            live_grep = {
                --@usage don't include the filename in the search results
                only_sort_text = true,
                previewer = true,
                layout_config = {
                    horizontal = {
                        width = 0.9,
                        height = 0.75,
                        preview_width = 0.6,
                    },
                },
            },
            grep_string = {
                --@usage don't include the filename in the search results
                only_sort_text = true,
                previewer = true,
                layout_config = {
                    horizontal = {
                        width = 0.9,
                        height = 0.75,
                        preview_width = 0.6,
                    },
                },
            },
            buffers = {
                -- initial_mode = 'normal',
                previewer = true,
                layout_config = {
                    horizontal = {
                        width = 0.5,
                        height = 0.4,
                        preview_width = 0.6,
                    },
                },
            },
            lsp_references = {
                show_line = true,
                layout_config = {
                    horizontal = {
                        width = 0.9,
                        height = 0.75,
                        preview_width = 0.6,
                    },
                },
            },
            treesitter = {
                show_line = true,
                sorting_strategy = nil,
                layout_config = {
                    horizontal = {
                        width = 0.9,
                        height = 0.75,
                        preview_width = 0.6,
                    },
                },
                symbols = {
                    'class', 'function', 'method', 'interface',
                    'type', 'const', 'variable', 'property',
                    'constructor', 'module', 'struct', 'trait', 'field'
                }
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = 'smart_case',       -- or 'ignore_case' or 'respect_case'
            },
            ['ui-select'] = {
                require 'telescope.themes'.get_dropdown({
                    previewer = false,
                    initial_mode = 'normal',
                    sorting_strategy     = 'ascending',
                    layout_strategy      = 'horizontal',
                    layout_config = {
                        horizontal = {
                            width = 0.5,
                            height = 0.4,
                            preview_width = 0.6,
                        },
                    },
                })

            },
        }
    })
    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension('refactoring')
    telescope.load_extension('dap')
    telescope.load_extension('zoxide')
end

return M
