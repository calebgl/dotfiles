return {
	{
		"rose-pine/neovim",
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},
				highlight_groups = {
					Visual = { bg = "rose", blend = 30 },
					LspSignatureActiveParameter = { bg = "rose", blend = 30 },
				},
			})
			-- vim.cmd.colorscheme("rose-pine")
		end,
	},

	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					floats = "transparent",
				},
				on_colors = function(colors)
					colors.bg_float = "NONE"
				end,
			})
			-- vim.cmd.colorscheme("tokyonight")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				transparent_mode = true,
			})
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},

	-- {
	-- 	"shaunsingh/nord.nvim",
	-- 	config = function()
	-- 		vim.g.nord_disable_background = true
	-- 		-- require('nord').set()
	-- 		-- vim.cmd.colorscheme("nord")
	-- 	end
	-- },

	{
		"gbprod/nord.nvim",
		config = function()
			require("nord").setup({
				transparent = true,
			})
			vim.cmd.colorscheme("nord")
			vim.api.nvim_set_hl(0, "Normal", { fg = "NONE", bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalFloat", { fg = "NONE", bg = "NONE" })
			vim.api.nvim_set_hl(0, "FloatBoder", { fg = "NONE", bg = "NONE" })
			vim.api.nvim_set_hl(0, "TreesitterContext", { fg = "NONE", bg = "NONE" })
			vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "NONE", bg = "NONE" })
		end,
	},
}
