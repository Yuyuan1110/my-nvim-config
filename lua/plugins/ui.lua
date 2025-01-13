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
		config = {},
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
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("lazy").setup({{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}})
		end
	},
--	{
--		"nvim-tree/nvim-tree.lua",
--		version = "*",
--		lazy = false,
--		dependencies = {
--		    "nvim-tree/nvim-web-devicons",
--		},
--		config = function()
--		    require("nvim-tree").setup {}
--		end,
--	},
{
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	mappings = {
		["l"] = "open",
		["h"] = "close_node",
		["<space>"] = "none",
	},
	config = true,
},

}
