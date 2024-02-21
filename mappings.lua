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
  n = {
    ["G"] = { "Gzz", "Go to end of file", opts = { nowait = true } },
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
    ["<leader>ob"] = {
      "<cmd> ObsidianBacklinks <CR>",
      "Obsidian Backlinks",
    },
    ["<leader>oq"] = {
      "<cmd> ObsidianQuickSwitch <CR>",
      "Obsidian Quick Switch",
    },
    ["<leader>otg"] = {
      "<cmd> ObsidianTags <CR>",
      "Obsidian Tags",
    },
    ["<leader>od"] = {
      "<cmd> ObsidianToday <CR>",
      "Obsidian Daily Note",
    },
    ["<leader>otp"] = {
      "<cmd> ObsidianTemplate <CR>",
      "Obsidian Templates",
    },
    ["<leader>os"] = {
      "<cmd> ObsidianSearch <CR>",
      "Obsidian Search",
    },
    ["<leader>ol"] = {
      "<cmd> ObsidianLinks <CR>",
      "Obsidian Links",
    },
  },
  v = {
    ["<leader>oll"] = {
      "<cmd> ObsidianLink <CR>",
      "Obsidian Link",
    },
    ["<leader>oln"] = {
      "<cmd> ObsidianLinkNew <CR>",
      "Obsidian Link New",
    },
  },
}

return M
