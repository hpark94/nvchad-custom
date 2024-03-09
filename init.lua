local opt = vim.opt

local g = vim.g
g.maplocalleader = " "
g.codeium_disable_bindings = 1

opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.spelllang = { "de", "en" }
opt.spell = true
opt.termguicolors = true

vim.cmd [[autocmd VimEnter * silent! au! FileExplorer *]]
vim.cmd [[autocmd InsertEnter * norm zz]]
vim.cmd [[au FocusGained,BufEnter * :silent! !]]
