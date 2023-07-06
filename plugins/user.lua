return {
	-- You can also add new plugins here as well:
	"RishabhRD/nvim-cheat.sh",   --
	"danilamihailov/beacon.nvim", -- cursor window movement blink
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {}
	},
	{
		'nacro90/numb.nvim', -- show line numbers on the side
		config = function()
			require('numb').setup()
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end
	},
	{
		'jghauser/fold-cycle.nvim',
		config = function()
			require('fold-cycle').setup({
				open_if_max_closed = true, -- closing a fully closed fold will open it
				close_if_max_opened = true, -- opening a fully open fold will close it
			})
		end
	},
	{
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require('hop').setup({
				multi_windows = false,
				case_insensitive = true,
				teasing = true,
				jump_on_sole_occurrence = true,
				keys = "aoeuhtns;,.pgcrl'qjkmwvzd",
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require('harpoon').setup({
				menu = {
					width = vim.api.nvim_win_get_width(0) - 4,
					height = 8
				}
			})
		end
	},
	{ 'kevinhwang91/nvim-bqf' }, -- BETTER quickfix
	-- {
	-- 	"xiyaowong/transparent.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("transparent").setup({
	-- 			groups = { -- table: default groups
	-- 				'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
	-- 				'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
	-- 				'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
	-- 				'SignColumn', 'CursorLineNr', 'EndOfBuffer',
	-- 			},
	-- 			extra_groups = {
	-- 				"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
	-- 				"NvimTreeNormal", -- NvimTree
	-- 				"NeoTreeNormal",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
