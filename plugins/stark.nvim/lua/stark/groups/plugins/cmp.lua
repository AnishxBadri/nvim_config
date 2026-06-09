local M = {}

function M.get(p, cfg)
	return {
		-- ── Abbreviation ──
		CmpItemAbbr = { fg = p.fg },
		CmpItemAbbrDeprecated = { fg = p.fg_dim, strikethrough = true },
		CmpItemAbbrMatch = { fg = p.sky, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = p.sky },
		CmpItemMenu = { fg = p.fg_dim, italic = true },

		-- ── Kind icons ──
		CmpItemKindDefault = { fg = p.fg_dim },
		CmpItemKindText = { fg = p.fg },
		CmpItemKindKeyword = { fg = p.fg_bright },
		CmpItemKindVariable = { fg = p.fg },
		CmpItemKindConstant = { fg = p.amber },
		CmpItemKindReference = { fg = p.rose },
		CmpItemKindValue = { fg = p.amber },
		CmpItemKindFunction = { fg = p.amber_br },
		CmpItemKindMethod = { fg = p.amber_br },
		CmpItemKindConstructor = { fg = p.amber_br },
		CmpItemKindClass = { fg = p.amber },
		CmpItemKindInterface = { fg = p.amber },
		CmpItemKindStruct = { fg = p.amber },
		CmpItemKindEvent = { fg = p.sky },
		CmpItemKindEnum = { fg = p.amber },
		CmpItemKindUnit = { fg = p.amber },
		CmpItemKindModule = { fg = p.fg_bright },
		CmpItemKindProperty = { fg = p.mint },
		CmpItemKindField = { fg = p.mint },
		CmpItemKindTypeParameter = { fg = p.amber },
		CmpItemKindEnumMember = { fg = p.amber },
		CmpItemKindOperator = { fg = p.fg_dim },
		CmpItemKindSnippet = { fg = p.sky },
		CmpItemKindColor = { fg = p.rose },
		CmpItemKindFile = { fg = p.fg_dim },
		CmpItemKindFolder = { fg = p.sky },
	}
end

return M
