return {
	"epwalsh/obsidian.nvim",
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand "~" .. "/Documents/Obsidian Vault/**.md",
		"BufNewFile " .. vim.fn.expand "~" .. "/Documents/Obsidian Vault/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "myNotes",
				path = "~/Documents/Obsidian Vault",
			},
		},

		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},

		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["<C-]>"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},

		-- Optional, for templates (see below).
		templates = {
			subdir = "Templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},

		-- This is the important part
		on_attach = function(bufnr)
			vim.opt.conceallevel = 0
		end,
	},
}

