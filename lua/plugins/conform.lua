return {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        formatters_by_ft = {
            python = { "ruff_format" },
            lua = { "stylua" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            json = { "prettier" },
            jsonc = { "prettier" },
            markdown = { "prettier" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format({ async = true })
            end,
            desc = "Format buffer",
        },
    },
}
