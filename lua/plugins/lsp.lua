return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/lazydev.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-path",
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',

		},

		config = function()
			local servers = {
					lua_ls = {
						Lua = {
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						}
					},
					bashls = {},
					neocmake = {},
					html = {},
					jdtls = {}, --java lsp
					eslint = {}, -- js lsp
					jsonls = {},
					kotlin_language_server = {},
					remark_ls = {},
					perlnavigator = {},
					pyright = {},
					lemminx = {},
					yamlls = {},
				},
				require('lazydev').setup()
			require('mason').setup()

			local on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

				buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
				local opts = { noremap = true, silent = true }

				buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
				buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
				buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
				buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
				buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
				buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
				buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
				buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
				buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				buf_set_keymap('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

				client.server_capabilities.document_formatting = true
			end

			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require('mason-lspconfig').setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup {
							settings = servers[server_name],
							on_attach = on_attach,
							capabilities = capabilities,
						}
					end,
					require('lspconfig').clangd.setup {
						settings = {
							clangd = {
								-- ... other clangd settings ...
								formatting = {
									style = "file", -- Use .clang-format if available
									fallbackStyle = { -- Fallback style if no .clang-format
										BasedOnStyle = "LLVM",
										IndentWidth = 4,
									}
								}
							}
						},
						on_attach = on_attach,
						capabilities = capabilities,
					}
				},
			})
			local cmp = require('cmp')
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'path' },
					{ name = 'buffer' },
				}),
				window = {
					completion = cmp.config.window.bordered(),
				}
			})
		end,
	},
}
