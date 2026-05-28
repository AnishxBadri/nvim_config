return {
	{
		dir = vim.fn.expand("~/.config/nvim/plugins/stark.nvim"),
		name = "stark.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			vim.cmd.colorscheme("stark")
		end,
	},
}
