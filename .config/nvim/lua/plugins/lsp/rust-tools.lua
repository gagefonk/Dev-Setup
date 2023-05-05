local M = {
    "simrat39/rust-tools.nvim",
    lazy = false,
    enabled = true,
}

M.config = function()
    local ih = require("inlay-hints")
    -- ih.setup()
    require("rust-tools").setup({
        server = {
            settings = {
                ["rust-analyzer"] = {
                    check = {
                        command = "clippy",
                    },
                    cargo = {
                        loadOutDirsFromCheck = true,
                    },
                    lens = {
                        enable = true,
                    },
                    procMacro = {
                        enable = true,
                    },
                },
            },
        },
        tools = {
            executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
            reload_workspace_from_cargo_toml = true,
            runnables = {
                use_telescope = true,
            },
            inlay_hints = {
                auto = false,
                only_current_line = false,
                show_parameter_hints = false,
                parameter_hints_prefix = "<-",
                other_hints_prefix = "=>",
                max_len_align = false,
                max_len_align_padding = 1,
                right_align = false,
                right_align_padding = 7,
                highlight = "Comment",
            },
            hover_actions = {
                border = "rounded",
            },
            on_initialized = function()
                ih.set_all()

                vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                    pattern = { "*.rs" },
                    callback = function()
                        local _, _ = pcall(vim.lsp.codelens.refresh)
                    end,
                })
            end,
        },
    })   
end

return M