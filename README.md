# My custom folder for NvChad

## Installation

```shell
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
cd ~/.config/nvim/lua/
rm -rf custom
git clone https://github.com/hpark94/nvchad-custom.git custom

```

## Features

- VimTex
- LSP (see configs/lspconfig.lua)
- none-ls (see configs/null-ls.lua)
- DAP (Python)
- custom key mappings
