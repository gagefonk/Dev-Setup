local M = {
    'bennypowers/splitjoin.nvim',
}

M.keys = {
    { 'gJ', function() require 'splitjoin'.join() end, desc = 'Join the object under cursor' },
    { 'gS', function() require 'splitjoin'.split() end, desc = 'Split the object under cursor' },
}

return M