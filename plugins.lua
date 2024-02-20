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
        "xml",
      },
    },
  },

  {
    "oflisback/obsidian-bridge.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("obsidian-bridge").setup {
        obsidian_server_address = "http://localhost:27123",
        scroll_sync = true,
      }
    end,
    event = {
      "BufReadPre *.md",
      "BufNewFile *.md",
    },
    lazy = true,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      -- Enable Netrw to make the 'gx' shortcut work
      disable_netrw = false,
      hijack_netrw = false,
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "haskell-language-server",
        "lua-language-server",
        "black",
        "jdtls",
        "stylua",
        "marksman",
        "fourmolu",
        "prettier",
        "texlab",
        "typescript-language-server",
        "eslint-lsp",
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      return require "custom.configs.obsidian"
    end,
    config = function(_, opts)
      require("core.utils").load_mappings "obsidian"
      require("obsidian").setup(opts)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_syntax_enabled = 0
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<A-j>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<A-k>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      require("core.utils").load_mappings "markdown"
    end,
  },
}

return plugins
