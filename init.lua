local opt = vim.opt

local g = vim.g
g.maplocalleader = " "
g.codeium_disable_bindings = 1

opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.scrolloff = 999
opt.colorcolumn = "80"
opt.wrap = false
opt.spelllang = { "de", "en" }
opt.spell = true

vim.cmd [[autocmd VimEnter * silent! au! FileExplorer *]]
