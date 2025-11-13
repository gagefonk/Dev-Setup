return {
    {
        "nvchad/ui",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        config = function()
            require("nvchad")
        end,
        keys = {
            { "<leader>d", function() require("nvchad.tabufline").close_buffer() end, desc = "Close Buffer" },
            { "<TAB>", function() require("nvchad.tabufline").next() end, desc = "Next Buffer" },
            { "<S-TAB>", function() require("nvchad.tabufline").prev() end, desc = "Prev Buffer" },
        },
    },

    {
        "nvchad/base46",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("base46").load_all_highlights()
        end,
    }
}
