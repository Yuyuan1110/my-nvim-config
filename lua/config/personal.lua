-- 取得當前 buffer 的編號
local bufnr = vim.api.nvim_get_current_buf()
-- 將 'modifiable' 選項設定為 true
vim.api.nvim_buf_set_option(bufnr, 'modifiable', true)
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.termguicolors = true
vim.opt.termguicolors = true
--vim.wo.colorcolumn = "160"
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = ""
vim.o.expandtab = false
vim.o.wildmenu = true
vim.opt.completeopt = { "menu", "menuone"}
vim.swapfile = false
vim.backup = false
vim.updatetime = 50
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.o.exrc = true
vim.o.wrap = false
vim.o.splitright = true
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")
vim.o.clipboard = "unnamedplus"
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
