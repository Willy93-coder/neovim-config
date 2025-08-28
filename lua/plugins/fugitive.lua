return {
	{"tpope/vim-fugitive",
	cmd = {"G", "Git"},
	keys = {
		{"<leader>gf", ":Git fetch --all<cr>", desc = "Git fetch"},
		{"<leader>gl", ":Git pull<cr>", desc = "Git pull"},
	},
	},
}
