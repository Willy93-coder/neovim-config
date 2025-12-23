return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				-- Core
				"bash",
				"c",
				"css",
				"html",
				"javascript",
				"typescript",
				"json",
				"lua",
				"luadoc",
				"luap",
				"vim",
				"vimdoc",
				"vue",
				"regex",
				"yaml",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"markdown",

				-- Docker ecosystem
				"dockerfile", -- Dockerfile
				"toml", -- many tooling configs
				"gitignore", -- .dockerignore is basically gitignore syntax
				"make", -- Makefile (common in docker projects)
				"hcl", -- Terraform, some tooling configs
				"terraform", -- IaC commonly used with Docker
				"helm", -- Helm charts (K8s, often alongside Docker)
				"kubernetes", -- Kubernetes manifests (if you work with k8s)
				"nginx", -- reverse proxies / container fronting
				"ini", -- .env-like / tooling configs (some)
				"proto", -- gRPC/protobuf (common in microservices)
				"sql", -- DB init scripts in containers
				"graphql", -- if your stack uses it (you do)
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		},
	},
}
