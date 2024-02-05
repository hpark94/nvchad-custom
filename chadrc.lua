---@type ChadrcConfig
local M = {}

M.ui = { theme = 'catppuccin' }
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

vim.api.nvim_set_hl(0, "Comment", { fg = "#999999"})
vim.api.nvim_set_hl(0, "@comment", { link = "Comment"})

return M
