# My custom folder for NvChad

## Installation

Remove existing nvim settings

```shell
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

Install NvChad without example

```shell
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

```

Install custom folder

```shell
rm -rf ~/.config/nvim/lua/custom
git clone https://github.com/hpark94/nvchad-custom.git ~/.config/nvim/lua/custom

```

Then open nvim and run `:MasonInstallAll`

## Features

Besides NvChad, I use some custom plugins.

### Latex

I utilize the `lervag/vimtex` plugin for compiling LaTeX documents.
For viewing PDFs, I prefer zathura.

### LSP

Various LSP servers are installed, located in
`~/.config/nvim/lua/custom/configs/lspconfig.lua`

### Formatting and linting

For formatting and linting different filetypes, I rely on the
`nvimtools/none-ls.nvim` plugin. This plugin is the
community-maintained version of `jose-elias-alvarez/null-ls.nvim`.
The configuration settings are located in
`~/.config/nvim/lua/custom/configs/null-ls.lua`.

### AI-Tool

I use the `Exafunction/codeium.vim` plugin for AI code completion.
Running the command `:Codeium Auth` will open a browser for authentication.

### Git

I use the `tpope/vim-fugitive` plugin for git commands.

### Markdown

I use the `iamcco/markdown-preview.nvim` plugin for markdown preview.

### Obsidian

I use the `epwalsh/obsidian.nvim` plugin for Obsidian.

### Other Settings

-   Custom Mappings (see `~/.config/nvim/lua/custom/mappings.lua`)
-   Auto open and close nvim-tree (see `~/.config/nvim/lua/custom/chadrc.lua`)
-   Custom color for comments (see `~/.config/nvim/lua/custom/chadrc.lua`)
