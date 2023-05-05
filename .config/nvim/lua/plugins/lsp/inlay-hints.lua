local M = {
    'simrat39/inlay-hints.nvim', 
}

M.config = function()
    require 'inlay-hints'.setup({
        only_current_line = false,
        eol = {
            right_align = false,
        },
    })
end

return M