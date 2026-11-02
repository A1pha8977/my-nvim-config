return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    cmd = "WhichKey",
    opts = {
        preset = "modern",
        delay = 300,
        spec = {
            { "<leader>b", group = "Buffers" },
            { "<leader>h", group = "Hop" },
            { "<leader>l", group = "LSP" },
            { "<leader>t", group = "Tree" },
        },
    },
}
