return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        ensure_installed = {
            "ruff",
            "stylua",
            "clang-format",
            "prettier",
        },
        run_on_start = true,
        auto_update = false,
    },
}
