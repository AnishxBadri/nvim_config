local M = {}

function M.get(p, cfg)
	return {
		GitSignsAdd = { fg = p.mint },
		GitSignsChange = { fg = p.amber },
		GitSignsDelete = { fg = p.red },
		GitSignsTopDelete = { fg = p.red },
		GitSignsChangeDelete = { fg = p.amber },
		GitSignsUntracked = { fg = p.fg_dim },
		GitSignsAddNr = { fg = p.mint },
		GitSignsChangeNr = { fg = p.amber },
		GitSignsDeleteNr = { fg = p.red },
		GitSignsAddLn = { bg = p.diff_add },
		GitSignsChangeLn = { bg = p.diff_chg },
		GitSignsDeleteLn = { bg = p.diff_del },
		GitSignsAddInline = { fg = p.mint, bg = p.diff_add, bold = true },
		GitSignsChangeInline = { fg = p.amber_br, bg = p.diff_txt, bold = true },
		GitSignsDeleteInline = { fg = p.red, bg = p.diff_del, bold = true },
	}
end

return M
