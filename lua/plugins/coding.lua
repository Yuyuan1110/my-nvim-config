return{
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
--			require('lazy').setup({
			require('nvim-treesitter.configs').setup({
				ensure_installed = {
					"bash",
					"ssh_config",
					"diff",
					"java",
					"kotlin",
					"html",
					"css",
					"javascript",
					"php",
					"nginx",
					"c", 
					"cpp",
					"make",
					"python",
					"perl",
					"lua", 
					"vim", 
					"vimdoc", 
					"query", 
					"markdown", 
					"markdown_inline",
					"sql",
				},
				build = ":TSUpdate",
				indent = { enable = true },
				fold = {
					enable = true, 
					fold_level_start = 0,  
					fold_level = 99,  
				}
			})
		end
	},
}
