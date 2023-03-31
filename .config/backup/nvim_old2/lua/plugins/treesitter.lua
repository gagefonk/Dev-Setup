return {
    'nvim-treesitter/nvim-treesitter',
    config = {
        ensure_installed = {
            'bash',
            'c',
            'javascript',
            'json',
            'lua',
            'python',
            'typescript',
            'tsx',
            'css',
            'markdown',
            'markdown_inline',
            'rust',
            'java',
            'yaml',
        },
        highlight = {
            enable = true,
        },
        autopairs = {
            enable = true,
        },
        indent = {
            enable = true,
            disable = {
                'python',
                'css',
            },
        },
    },
}