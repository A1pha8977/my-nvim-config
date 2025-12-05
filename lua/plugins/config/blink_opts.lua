return {
    completion = {
        documentation = {
            auto_show = true,
        },
    },
    keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = {
            "snippet_forward",
            "select_next",
            "fallback",
        },
        ["<S-Tab>"] = {
            "snippet_backward",
            "select_prev",
            "fallback",
        },
    },
    sources = {
        default = { "path", "snippets", "buffer", "lsp" },
    },
    cmdline = {
        sources = function()
            local cmd_type = vim.fn.getcmdtype()
            if cmd_type == "/" or cmd_type == "?" then
                return { "buffer" }
            end
            if cmd_type == ":" then
                return { "cmdline" }
            end
            return {}
        end,
        keymap = {
            preset = "super-tab",
        },
        completion = {
            menu = {
                auto_show = true,
            },
        },
    },
}

