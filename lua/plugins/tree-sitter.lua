return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"lua",
				"luadoc",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
	},
}
