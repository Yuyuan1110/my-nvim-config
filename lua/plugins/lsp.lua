return{
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neoconf.nvim",
			"folke/neodev.nvim",
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
				nginx_language_server = {},
				perlnavigator = {},
				pyright = {},
				sqls = {},
				lemminx = {},
				yamlls = {}
			},
			require('neoconf').setup()
			require('neodev').setup()
			require('mason').setup()
			require('mason-lspconfig').setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup{
							settings = servers[server_name],
							on_attach = on_attach,
						}
					end
				},
			})
		end,
	},
}
