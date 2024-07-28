return {
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  {
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					"lazy.nvim",
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
}
