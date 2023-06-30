return {
	-- You can also add new plugins here as well:
	"RishabhRD/nvim-cheat.sh",   --
	"danilamihailov/beacon.nvim", -- cursor window movement blink
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {}
	},
	"nvim-treesitter/nvim-treesitter-context", -- function context on top
	{
		'nacro90/numb.nvim',
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
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup {
					suggestion = {
						enable = true,
						auto_trigger = true,
						keymap = {
							next = "<C-h>",
							prev = "<C-l>",
							accept = "<C-c>"
						},
					}
				}
			end, 100)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua", "nvim-cmp" },
		config = function()
			require("copilot_cmp").setup()
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
	{
		"windwp/nvim-spectre",
		config = function() -- Super Search
			require("spectre").setup({
				mapping = {
					['send_to_qf'] = {
						map = "<leader>e",
						cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
						desc = "send all item to quickfix"
					},
				}
			})
		end
	},
	{ 'kevinhwang91/nvim-bqf' }, -- BETTER quickfix
	{
		"kylechui/nvim-surround", --  the YSSR
		version = "*",            -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true,
				comments = { bold = true, italic = false },
				keywords = { bold = true, italic = false },
			})
		end
	},
}
