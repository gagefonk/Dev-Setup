local M = {
    "saecki/crates.nvim",
    version = "v0.3.0",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" }, 
}

M.config = function()
    require("crates").setup {
        null_ls = {
            enabled = true,
            name = "crates.nvim",
        },
        popup = {
            border = "rounded",
        },
    }
end

return M