return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local parsers = {
            "c",
            "cpp",
            "java",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "vim",
            "vimdoc",
        }

        require("nvim-treesitter").install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
            callback = function(event)
                local language = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
                if vim.tbl_contains(parsers, language) and vim.treesitter.language.add(language) then
                    vim.treesitter.start(event.buf, language)
                end
            end,
        })
    end,
}
