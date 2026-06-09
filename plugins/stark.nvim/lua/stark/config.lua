local M = {}

M.defaults = {
	transparent = false,
	italic_comments = true,
	italic_imports = true,
	bold_keywords = true,
	on_colors = function(p) end,
	on_highlights = function(hl, p) end,
	plugins = {
		telescope = true,
		snacks = true,
		["neo-tree"] = true,
		cmp = true,
		gitsigns = true,
		lazy = true,
		mini = true,
		whichkey = true,
		notify = true,
		indent = true,
	},
}

M.options = vim.deepcopy(M.defaults)

function M.extend(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
