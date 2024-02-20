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
  i = {
    ["jj"] = { "<esc>", "escape insert mode", opts = { nowait = true } },
  },
}

M.markdown = {
  plugin = true,
  n = {
    ["<leader>mp"] = {
      "<cmd> MarkdownPreviewToggle <CR>",
      "Toggle markdown preview",
    },
  },
}

M.obsidian = {
  plugin = true,
  n = {
    ["<leader>oo"] = {
      "<cmd> ObsidianOpen <CR>",
      "Open Obsidian",
    },
  },
}

return M
