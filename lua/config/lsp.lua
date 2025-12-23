-- Apply capabilities to All LSPs by default (using blink.cmp)
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

----------------------------------------------------------------
-- Register individual server configurations
-- Make sure your paths match your real structure
----------------------------------------------------------------
vim.lsp.config("vtsls", require("lsp.vtsls"))
vim.lsp.config("vue_ls", require("lsp.vue_ls"))
vim.lsp.config("emmet_language_server", require("lsp.emmet_language_server"))
vim.lsp.config("lua_ls", require("lsp.lua_ls"))
vim.lsp.config("gopls", require("lsp.gopls"))
vim.lsp.config("clangd", require("lsp.clangd"))
vim.lsp.config("docker_language_server", require("lsp.docker_language_server"))
vim.lsp.config("yamlls", require("lsp.yamlls"))

----------------------------------------------------------------
-- LspAttach: keymaps and common logic for ALL LSPs
----------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- If for some reason the client is not available, just return
		if not client then
			return
		end

		-- Helper function to define keymaps
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = bufnr,
				desc = desc,
				silent = true,
				noremap = true,
			})
		end

		-- Navigation
		map("n", "gd", vim.lsp.buf.definition, "[LSP] Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "[LSP] Go to declaration")
		map("n", "gr", vim.lsp.buf.references, "[LSP] References")
		map("n", "gi", vim.lsp.buf.implementation, "[LSP] Implementation")
		map("n", "K", vim.lsp.buf.hover, "[LSP] Hover")
		map("n", "<leader>rn", vim.lsp.buf.rename, "[LSP] Rename")
		map("n", "<leader>ca", vim.lsp.buf.code_action, "[LSP] Code action")

		-- Signature help
		map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "[LSP] Signature help")

		-- Formatting, only if supported
		if client.server_capabilities.documentFormattingProvider then
			map("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, "[LSP] Format buffer")
		end

		-- Show line diagnostics
		map("n", "<leader>e", vim.diagnostic.open_float, "[LSP] Show diagnostics popup")
	end,
})

----------------------------------------------------------------
-- Diagnostic configuration
----------------------------------------------------------------
vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		focusable = true,
		max_width = 80,
		max_height = 20,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

----------------------------------------------------------------
-- Enable LSP servers
-- Only list LSPs you want active
----------------------------------------------------------------
vim.lsp.enable({
	"lua_ls",
	"gopls",
	"vtsls",
	"clangd",
	"vue_ls",
	"emmet_language_server",
	"docker_language_server",
	"yamlls",
})
