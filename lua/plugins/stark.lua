return {
	{
		"AnishxBadri/Stark.nvim",
		name = "stark.nvim",
		dev = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("stark")
		end,
	},
}
