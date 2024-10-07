require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {'lua_ls', 'gopls', 'bashls', 'cssls', 'dockerls', 'html', 'templ', }
})
