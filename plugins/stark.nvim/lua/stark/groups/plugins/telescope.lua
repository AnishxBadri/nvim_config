local M = {}

function M.get(p, cfg)
	return {
		TelescopeNormal = { fg = p.fg, bg = p.bg_code },
		TelescopePromptNormal = { fg = p.fg, bg = p.bg_code },
		TelescopeResultsNormal = { fg = p.fg, bg = p.bg_code },
		TelescopePreviewNormal = { fg = p.fg, bg = p.bg },
		TelescopeBorder = { fg = p.gray, bg = p.bg_code },
		TelescopePromptBorder = { fg = p.sky, bg = p.bg_code },
		TelescopeResultsBorder = { fg = p.gray, bg = p.bg_code },
		TelescopePreviewBorder = { fg = p.gray, bg = p.bg },
		TelescopePromptPrefix = { fg = p.sky },
		TelescopePromptCounter = { fg = p.fg_dim },
		TelescopeSelection = { fg = p.fg_bright, bg = p.bg_hover },
		TelescopeSelectionCaret = { fg = p.sky, bg = p.bg_hover },
		TelescopeMultiSelection = { fg = p.mint, bg = p.bg_hover },
		TelescopeMultiIcon = { fg = p.mint },
		TelescopeTitle = { fg = p.fg_bright, bold = true },
		TelescopePromptTitle = { fg = p.bg, bg = p.sky, bold = true },
		TelescopeResultsTitle = { fg = p.fg_dim },
		TelescopePreviewTitle = { fg = p.bg, bg = p.mint, bold = true },
		TelescopeMatching = { fg = p.sky, bold = true },
		TelescopeResultsDiffAdd = { fg = p.mint },
		TelescopeResultsDiffChange = { fg = p.amber },
		TelescopeResultsDiffDelete = { fg = p.red },
		TelescopeResultsDiffUntracked = { fg = p.fg_dim },
	}
end

return M
