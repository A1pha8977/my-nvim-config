local M = {}

function M.setup(capabilities)
    vim.lsp.config("*", {
        capabilities = capabilities,
    })

    local servers = {}
    for filename, filetype in vim.fs.dir(vim.fn.stdpath("config") .. "/lua/lsp") do
        local name = filename:match("^(.+)%.lua$")
        if filetype == "file" and name and name ~= "init" then
            table.insert(servers, name)
        end
    end
    table.sort(servers)

    for _, name in ipairs(servers) do
        vim.lsp.config(name, require("lsp." .. name))
    end

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
            local function map(lhs, rhs, desc)
                vim.keymap.set("n", lhs, rhs, { buffer = event.buf, silent = true, desc = desc })
            end

            map("gd", vim.lsp.buf.definition, "Go to definition")
            map("gD", vim.lsp.buf.declaration, "Go to declaration")
            map("gi", vim.lsp.buf.implementation, "Go to implementation")
            map("gr", vim.lsp.buf.references, "Find references")
            map("K", vim.lsp.buf.hover, "Hover documentation")
            map("<leader>le", vim.diagnostic.open_float, "Show line diagnostics")
        end,
    })

    vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        float = { border = "rounded", source = true },
    })

    return servers
end

return M
