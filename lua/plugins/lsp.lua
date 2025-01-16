return{
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/lazydev.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-path",
			'hrsh7th/cmp-nvim-lsp'
		},

		config = function()
			local servers = {
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false},
					}
				},
				bashls = {},
				clangd = {},
				neocmake = {},
				html = {},
				jdtls = {},
				eslint = {},
				jsonls = {},
				kotlin_language_server = {},
				remark_ls = {},
				perlnavigator = {},
				pyright = {},
				lemminx = {},
				yamlls = {}
			},
			require('lazydev').setup()
			require('mason').setup()
			require('mason-lspconfig').setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup{
							settings = servers[server_name],
							on_attach = on_attach,
							capabilities = require('cmp_nvim_lsp').default_capabilities(),
						}
					end
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
				})
			})
		end,
	},
}
