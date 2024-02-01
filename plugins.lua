local plugins = {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "latex",
                "java",
                "c",
                "cpp",
                "cmake",
                "haskell",
                "python",
                "xml"
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "haskell-language-server",
                "python-lsp-server",
                "jdtls",
                "texlab"
            },
        },
    },

    {
        "lervag/vimtex",
        lazy=false,
        init=function ()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_syntax_enabled = 0
            vim.g.vimtex_compiler_method = 'latexmk'
        end
    },

    {
        "Exafunction/codeium.vim",
        event = 'BufEnter',
        config = function ()
            vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<A-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<A-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    }
}

return plugins
