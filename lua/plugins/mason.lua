return {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason-lspconfig.nvim",
    },
    opts = {},
    config = function (_, opts)
        require("mason").setup(opts)
        local map = require("mason-lspconfig").get_mappings().package_to_lspconfig
        local registry = require "mason-registry"

        for _, server in ipairs(require("lsp.servers")) do
            local found_in_registry, package = pcall(registry.get_package, server)
            if not found_in_registry then
                goto check_next
            end

            if not package.is_installed then
                package:install()
            end

            local found_config, config = pcall(require, "lsp." .. server)
            if not found_config then
                config = {}
            end
            config.capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.lsp.config(map[server], config)
            vim.lsp.enable(map[server])
            ::check_next::
        end
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

    end
}
