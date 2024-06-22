return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "kanagawa", },
  },
  { "rebelot/kanagawa.nvim" },
  { "NoahTheDuke/vim-just" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "just", "kdl", "wgsl" },
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = { "wgsl-analyzer" },
		},
  },
  {
    "stevearc/conform.nvim",
    dependencies = { "clangd_extensions.nvim", "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        rust = { "rustfmt", lsp_format = "fallback" },
        python = { "ruff_format", "ruff_organize_imports" }
      },
    },
	},
}

