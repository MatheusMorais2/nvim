local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate"
        },
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        { 'mbbill/undotree' },
        { 'tpope/vim-fugitive' },
        { 'VonHeikemen/lsp-zero.nvim',        branch = 'v4.x' },
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
        { "williamboman/mason.nvim" },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { "williamboman/mason-lspconfig.nvim" },
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },
        { "rafamadriz/friendly-snippets" },
        { 'saadparwaiz1/cmp_luasnip' },
        {
            'sainnhe/sonokai',
            lazy = false,
            priority = 1000,
            config = function()
                -- Optionally configure and load the colorscheme
                -- directly inside the plugin declaration.
                vim.g.sonokai_enable_italic = true
                vim.cmd.colorscheme('sonokai')
            end
        },
        {'tpope/vim-commentary'}
    },

})
