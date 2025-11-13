return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
        indent = { enable = true },
        ensure_installed = {
            "json",
            "javascript",
            "typescript",
            "tsx",
            "go",
            "yaml",
            "html",
            "css",
            "python",
            "http",
            "prisma",
            "markdown",
            "markdown_inline",
            "graphql",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "query",
            "vimdoc",
            "c",
            "cpp",
            "cmake",
            "rust",
            "java",
            "swift",
            "toml",
            "regex",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>"
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
