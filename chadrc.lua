---@type ChadrcConfig
local M = {}

M.ui = { theme = "catppuccin" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = vim.tbl_filter(function(name)
        return string.sub(name, 1, 5) ~= "netrw"
      end, require("plugins.configs.lazy_nvim").performance.rtp.disabled_plugins),
    },
  },
}

-- open nvim-tree at start
local function open_nvim_tree()
  if vim.api.nvim_buf_line_count(0) == 1 and vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == "" then
    require("nvim-tree.api").tree.open()
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = open_nvim_tree,
})

-- auto close nvim-tree
local function is_modified_buffer_open(buffers)
  for _, v in pairs(buffers) do
    if v.name:match "NvimTree_" == nil then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if
        #vim.api.nvim_list_wins() == 1
        and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil
        and is_modified_buffer_open(vim.fn.getbufinfo { bufmodified = 1 }) == false
    then
      vim.cmd "quit"
    end
  end,
})

-- Comment color
vim.api.nvim_set_hl(0, "Comment", { fg = "#999999" })
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })

return M
