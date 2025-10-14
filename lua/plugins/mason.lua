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
        local to_lspconfig = require("mason-lspconfig").get_mappings().package_to_lspconfig
        local registry = require "mason-registry"

        for _, server_name in ipairs(require("lsp.servers")) do
            local found_in_registry, package = pcall(registry.get_package, server_name)
            if not found_in_registry then
                vim.notify("mason.lua: can not find " .. server_name .. " in registry", vim.log.levels.ERROR)
                goto check_next_server
            end

            if not package:is_installed() then
                vim.notify("mason.lua: install " .. server_name, vim.log.levels.WARN)
                package:install()
            end

            local found_config, config = pcall(require, "lsp." .. server_name)
            if not found_config then
                config = {}
            end
            config.capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.lsp.config(to_lspconfig[server_name], config)
            vim.lsp.enable(to_lspconfig[server_name])

            ::check_next_server::
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
