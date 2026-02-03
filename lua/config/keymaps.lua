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

		-- Prohibbited pyright's format feature.
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
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

-- Snack key mapping
-- Picker 
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep (Global Search)" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent Files" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
-- Lazygit
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git Blame Line" })
map("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
-- Interface
map("n", "<leader>z",  function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map({ "n", "t" }, "<c-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
-- Word jumping
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
-- Original key mapping
--		keys = {
--			{ "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
--			{ "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
--			{ "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
--			{ "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
--			{ "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
--			{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
--			{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
--			{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
--			{ "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
--			{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
--			{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
--			{ "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
--			{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
--			{ "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
--			{ "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
--			{ "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
--			{ "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
--			{
--				"<leader>N",
--				desc = "Neovim News",
--				function()
--					Snacks.win({
--						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
--						width = 0.6,
--						height = 0.6,
--						wo = {
--							spell = false,
--							wrap = false,
--							signcolumn = "yes",
--							statuscolumn = " ",
--							conceallevel = 3,
--						},
--					})
--				end,
--			}
--		},
