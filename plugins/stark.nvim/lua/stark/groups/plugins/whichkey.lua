local M = {}

function M.get(p, cfg)
	return {
		WhichKey = { fg = p.sky },
		WhichKeyGroup = { fg = p.mint, bold = true },
		WhichKeyDesc = { fg = p.fg },
		WhichKeySeperator = { fg = p.comment },
		WhichKeySeparator = { fg = p.comment },
		WhichKeyFloat = { bg = p.bg_code },
		WhichKeyBorder = { fg = p.gray, bg = p.bg_code },
		WhichKeyValue = { fg = p.fg_dim },
		WhichKeyTitle = { fg = p.fg_bright, bold = true },
	}
end

return M
