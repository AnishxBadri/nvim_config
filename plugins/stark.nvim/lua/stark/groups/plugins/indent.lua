local M = {}

function M.get(p, cfg)
	return {
		IblIndent = { fg = p.gray },
		IblScope = { fg = p.fg_dim },
		IblWhitespace = { fg = p.gray },
		IndentBlanklineChar = { fg = p.gray },
		IndentBlanklineContextChar = { fg = p.fg_dim },
		IndentBlanklineContextStart = { underline = true, sp = p.fg_dim },
	}
end

return M
