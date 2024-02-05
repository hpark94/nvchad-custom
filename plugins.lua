local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css", "javascript",
        "typescript",
        "tsx",
        "json",
        "latex", "java",
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
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "haskell-language-server",
        "black",
        "pyright",
        "jdtls",
        "debugpy",
        "mypy",
        "ruff",
        "prettier",
        "texlab",
        "typescript-language-server",
        "eslint-lsp"
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
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<A-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<A-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  }
}

return plugins
