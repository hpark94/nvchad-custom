local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<C-a>"] = "",
  },
}

-- Your custom mappings
M.abc = {
  n = {
    ["<"] = { "<<", "Indent line" },
    [">"] = { ">>", "Indent line" },
  },

  i = {
    ["jj"] = { "<esc>", "escape insert mode", opts = { nowait = true } },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
  },
}

return M
