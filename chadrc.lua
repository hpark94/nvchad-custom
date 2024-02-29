---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  changed_themes = {
    catppuccin = {
      base_16 = {
        base00 = "#181825",
      },
      base_30 = {
        grey_fg = "#999999",
      },
    },
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
