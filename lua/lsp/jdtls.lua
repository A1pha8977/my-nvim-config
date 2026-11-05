return {
	root_dir = function(bufnr, on_dir)
		local filename = vim.api.nvim_buf_get_name(bufnr)

		local root = vim.fs.root(filename, {
			".git",
			"pom.xml",
			"build.gradle",
			".java-root",
		})

		on_dir(root or vim.fn.getcwd())
	end,
}
