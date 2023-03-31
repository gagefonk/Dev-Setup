return {
    'nvim-lualine/lualine.nvim',
    config = {
        options = {
            icons_enabled = true,
            theme = "tokyonight",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "alpha", "dashboard", "Outline" },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { 
                {
                    "branch",
                    icons_enabled = true,
                    icon = "",
                },
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    sections = { "error", "warn" },
                    symbols = { error = " ", warn = " " },
                    colored = false,
                    update_in_insert = false,
                    always_visible = true,
                },
             },
            lualine_b = { 
                {
                    "mode",
                    fmt = function(str)
                        return "-- " .. str .. " --"
                    end,
                },
             },
            lualine_c = {},
            -- lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_x = { 
                {
                    "diff",
                    colored = false,
                    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
                    cond = hide_in_width
                }, 
                function()
                    return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
                end,
                "encoding",
                {
                    "filetype",
                    icons_enabled = false,
                    icon = nil,
                },
             },
            lualine_y = { 
                {
                    "location",
                    padding = 0,
                },
             },
            lualine_z = { 
                function()
                    local current_line = vim.fn.line(".")
                    local total_lines = vim.fn.line("$")
                    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
                    local line_ratio = current_line / total_lines
                    local index = math.ceil(line_ratio * #chars)
                    return chars[index]
                end,
             },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    }
}