return {
    "nvim-tree/nvim-tree.lua",
    dependence = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    },
    keys = {
        {"<leader>tt", ":NvimTreeToggle<CR>", silent = true},
    },
    config = function (_, opts)
        require("nvim-tree").setup(opts)
        vim.cmd("NvimTreeFocus")
        vim.cmd("wincmd w")

    end
}
