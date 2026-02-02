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
					eslint = {}, -- js lsp
					jsonls = {},
					marksman = {},
					perlnavigator = {},
					pyright = {},
					lemminx = {},
					yamlls = {},
					clangd = {
						formatting = {
							style = "file", -- Use .clang-format if available
							fallbackStyle = { -- Fallback style if no .clang-format
								BasedOnStyle = "LLVM",
								IndentWidth = 4,
							}
						}
					},
					dotls = {},
				},
			require('lazydev').setup()
			require('mason').setup()

			-- key mapping settings have been moved to config/keymaps.lua
			--			local on_attach = function(client, bufnr)
			--				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
			--				vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })
			--				local opts = { noremap = true, silent = true }
			--
			--				buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
			--				buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
			--				buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			--				buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
			--				buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
			--				buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
			--				buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
			--				buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
			--				buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
			--				buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
			--				buf_set_keymap('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
			--
			--				client.server_capabilities.document_formatting = true
			--			end

			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require('mason-lspconfig').setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					function(server_name)
						vim.lsp.config(server_name, {
							settings = servers[server_name],
							capabilities = capabilities,
						})
						vim.lsp.enable(server_name)
					end,

					-- The require('lspconfig') "framework" is deprecated, update below.
					-- Please refer to https://www.reddit.com/r/neovim/comments/1nmh99k/beware_the_old_nvimlspconfig_setup_api_is/
					--					require('lspconfig').clangd.setup {
					--						settings = {
					--							clangd = {
					--								-- ... other clangd settings ...
					--								formatting = {
					--									style = "file", -- Use .clang-format if available
					--									fallbackStyle = { -- Fallback style if no .clang-format
					--										BasedOnStyle = "LLVM",
					--										IndentWidth = 4,
					--									}
					--								}
					--							}
					--						},
					--						on_attach = on_attach,
					--						capabilities = capabilities,
					--					}
					vim.lsp.config("clangd", {
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
						capabilities = capabilities,
					})
				},
			})
		end,
	},
}
