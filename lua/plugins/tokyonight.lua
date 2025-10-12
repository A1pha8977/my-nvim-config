return {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
    opts = {
        style = "night",
    },
    config = function (_, opts)
        require("tokyonight").setup(opts)
    end
}
