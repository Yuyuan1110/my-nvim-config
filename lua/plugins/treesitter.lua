return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"bash", "ssh_config", "diff", "java", "kotlin", "html", "css",
					"javascript", "php", "nginx", "c", "cpp", "make", "python",
					"perl", "lua", "vim", "vimdoc", "query", "markdown",
					"markdown_inline", "sql", "xml", "yaml",
				},
				highlight = { enable = true },
				indent = { enable = true },

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},
						selection_modes = {
							['@parameter.outer'] = 'v',
							['@function.outer'] = 'V',
							['@class.outer'] = '<c-v>',
						},
						include_surrounding_whitespace = false,
					},
				},
			})
		end
	}
}
