return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {},
    keys = {
        { "<leader>bh", ":BufferLineCyclePrev<CR>", desc = "Previous buffer", silent = true },
        { "<leader>bl", ":BufferLineCycleNext<CR>", desc = "Next buffer", silent = true },
        { "<leader>bd", ":bdelete<CR>", desc = "Delete buffer", silent = true },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", desc = "Close other buffers", silent = true },
        { "<leader>bp", ":BufferLinePick<CR>", desc = "Pick buffer", silent = true },
        { "<leader>bc", ":BufferLinePickClose<CR>", desc = "Pick buffer to close", silent = true },
    },
}

