return{
	{
		'akinsho/bufferline.nvim', 
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function()
			local highlight = {
				"brown",
				"red",
				"orange",
				"yellow",
				"green",
				"blue",
				"purple",
				"gray",
				"white",
				"black",
			}

			local hooks = require "ibl.hooks"
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "brown", { fg = "#4d3900" })
				vim.api.nvim_set_hl(0, "red", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "orange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "yellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "green", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "blue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "purple", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "gray", { fg = "#7B7B7B" })
				vim.api.nvim_set_hl(0, "white", { fg = "#FCFCFC" })
				vim.api.nvim_set_hl(0, "black", { fg = "#000000" })
			end)
			require("ibl").setup({indent = { highlight = highlight }})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = {
			'echasnovski/mini.icons',
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require'alpha'.setup(require'alpha.themes.theta'.config)
		end
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require('illuminate').configure()
		end
	},
	

}
