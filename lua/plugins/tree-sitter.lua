return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"json",
				"lua",
				"luadoc",
				"luap",
				"vim",
				"vimdoc",
				"regex",
				"yaml",
				"go",
				"gomod",
				"gowork",
				"gosum",
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
