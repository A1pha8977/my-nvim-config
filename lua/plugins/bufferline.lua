return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {},
    keys = {
        { "<leader>bh", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer", silent = true },
        { "<leader>bl", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer", silent = true },
        { "<leader>bd", "<Cmd>bdelete<CR>", desc = "Delete buffer", silent = true },
        { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers", silent = true },
        { "<leader>bp", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer", silent = true },
        { "<leader>bc", "<Cmd>BufferLinePickClose<CR>", desc = "Pick buffer to close", silent = true },
    },
}

