return {
    "mason-org/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonLog" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    opts = {},
    config = function(_, opts)
        require("mason").setup(opts)

        local servers = require("lsp").setup(require("blink.cmp").get_lsp_capabilities())

        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_enable = servers,
        })
    end,
}
