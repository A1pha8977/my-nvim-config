return {
    "nvimdev/lspsaga.nvim",
    cmd = "Lspsaga",
    event = "LspAttach",
    opts = {
        lightbulb = {
            enable = false,
        },
        symbol_in_winbar = {
            enable = true,
            separator = " > ",
            show_file = true,
            folder_level = 1,
        },
        finder = {
            keys = {
                toggle_or_open = "<CR>",
            },
        },
    },
    keys = {
        { "<leader>lc", ":Lspsaga code_action<CR>", desc = "Code action" },
        { "<leader>ld", ":Lspsaga peek_definition<CR>", desc = "Preview definition" },
        { "<leader>lh", ":Lspsaga hover_doc<CR>", desc = "Hover documentation" },
        { "<leader>lR", ":Lspsaga finder<CR>", desc = "Find references and implementations" },
        { "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic" },
        { "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic" },
    }
}

