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
				}
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
					floats = "transparent"
				},
				on_colors = function(colors)
					colors.bg_float = "NONE"
				end
			})
			-- vim.cmd.colorscheme("tokyonight")
		end
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true
			})
			vim.cmd.colorscheme("catppuccin")
		end
	}
}
