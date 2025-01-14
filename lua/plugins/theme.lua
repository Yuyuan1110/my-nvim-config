return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	    opts = {},
		config = function()
			vim.cmd[[colorscheme tokyonight-moon]]
		end
	},
	{
	    'nvim-lualine/lualine.nvim',
	    dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup ({
				options = {
					theme = 'tokyonight-moon',
				}
			})
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
	    dependencies = {
	    "SmiteshP/nvim-navic",
	    "nvim-tree/nvim-web-devicons",
		},
		config = function()
			require('barbecue').setup()
		end,
	 }
}
