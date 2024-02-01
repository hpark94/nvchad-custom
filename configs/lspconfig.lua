local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

lspconfig.hls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
