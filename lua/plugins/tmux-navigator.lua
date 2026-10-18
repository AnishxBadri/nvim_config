return {
	{
		"christoomey/vim-tmux-navigator",
		init = function()
			-- Don't unzoom a maximized tmux pane when hitting the edge of nvim splits
			vim.g.tmux_navigator_disable_when_zoomed = 1
		end,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left (nvim/tmux)" },
			{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down (nvim/tmux)" },
			{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up (nvim/tmux)" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right (nvim/tmux)" },
			{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous (nvim/tmux)" },
		},
	},
}
