return {
	{
		"jackm245/nordark.nvim",
		lazy = false, -- Load it immediately
		priority = 1000, -- Ensures it loads before other plugins
		config = function()
			vim.cmd.colorscheme("nordark") -- Set the colorscheme
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
}
