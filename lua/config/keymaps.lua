local map = vim.keymap.set
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
--map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
--map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
--map("n", "<c-/>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })

-- LSP key maps
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, noremap = true, silent = true }
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		-- Prohibbited pyright's format feature.
		if client.name == "pyright" then
			client.server_capabilities.documentFormattingProvider = false
		end

		map('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
		map('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
		map('n', 'K', vim.lsp.buf.hover, opts)
		map('n', 'gh', vim.lsp.buf.signature_help, opts)
		map('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
		map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
		map('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous Diagnostic" })
		map('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next Diagnostic" })
		--		map('n', '[d', vim.diagnostic.goto_prev, opts)
		--		map('n', ']d', vim.diagnostic.goto_next, opts)
		map('n', '<leader>ll', vim.lsp.codelens.run, opts)
		map('n', '<leader>lR', vim.lsp.buf.rename, opts)
		map('n', '<leader>F', function() vim.lsp.buf.format { async = true } end,
			vim.tbl_extend("force", opts, { desc = "LSP: Format code" }))

		-- clangd setup
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client then
			client.server_capabilities.documentFormattingProvider = true
		end
	end,
})
