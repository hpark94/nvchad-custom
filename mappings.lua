local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<C-a>"] = "",
  },
}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
  },

  n = {
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },
    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "jzz" : "gjzz"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "kzz" : "gkzz"', "Move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "kzz" : "gkzz"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "jzz" : "gjzz"', "Move down", opts = { expr = true } },

    -- new buffer
    ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
    ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },

  v = {
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "kzz" : "gkzz"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "jzz" : "gjzz"', "Move down", opts = { expr = true } },
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },
  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "jzz" : "gjzz"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "kzz" : "gkzz"', "Move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },
}
-- Your custom mappings
M.abc = {
  i = {
    ["jj"] = { "<esc>", "escape insert mode", opts = { nowait = true } },
  },
  n = {
    ["G"] = { "Gzz", "Go to end of file", opts = { nowait = true } },
    ["}"] = { "}zz", "Jump to next paragraph", opts = { nowait = true } },
    ["{"] = { "{zz", "Jump to previous paragraph", opts = { nowait = true } },
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
