-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 	  "nvim-lua/plenary.nvim",
	-- 	  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 	  "MunifTanjim/nui.nvim",
	-- 	  "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	-- 	}
	-- }

	{
		-- file explorer
		"nvim-tree/nvim-tree.lua",

		config = function ()
			require("nvim-tree").setup()
		end,
	},

	{
		-- color scheme
		"Shatur/neovim-ayu",

		priority = 1000,
		config = function()

			local colors = require('ayu.colors')
			colors.generate(true) -- Pass `true` to enable mirage

			require("ayu").setup({
				mirage = true,

				overrides = {
					NormalFloat = { bg = colors.panel_bg },
				   WhichKeyFloat = { bg = colors.panel_bg },
					FloatBorder = { bg = colors.panel_border },
					FloatShadow = { bg = colors.panel_shadow },
				},
			})

			require("ayu").colorscheme()

		end,
	},

	{
		-- auto close brackets, etc.
		"windwp/nvim-autopairs",

		config = function()
			require('nvim-autopairs').setup{}
		end,
	},

	{
		"vladdoster/remember.nvim",

		config = function ()
			require('remember').setup{}
		end,
	},
	-- {
	-- 	-- restore cursor position on file load
	-- 	"ethanholz/nvim-lastplace",
	--
	-- 	config = function()
	-- 		require('nvim-lastplace').setup{}
	-- 	end,
	-- },

	{
		-- https://github.com/simrat39/rust-tools.nvim
		"simrat39/rust-tools.nvim",

		config = function()
			local rt = require("rust-tools")

			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						-- Hover actions
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						-- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
			   },
			})
		end,
	},
}
