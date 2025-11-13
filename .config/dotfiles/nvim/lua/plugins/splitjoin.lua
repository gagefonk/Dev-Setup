return {
    "echasnovski/mini.splitjoin",
    event = { "BufReadPre", "BufNewFile" },
    -- TODO: Need to figure out the post hook for padding this still...
    opts = {
        mappings = { toggle = "" },
    },
    keys = {
        { "<leader>sj", mode = { "n", "x" }, function() require("mini.splitjoin").split() end, desc = "split" },
        { "<leader>sk", mode = { "n", "x" }, function() require("mini.splitjoin").join() end, desc = "join" }
    },
}
