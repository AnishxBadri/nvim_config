local M = {}

function M.get(p, cfg)
	local italic_c = cfg.italic_comments or nil
	local kw_bold = cfg.bold_keywords or nil

	return {
		-- ── Comments ──
		Comment = { fg = p.comment, italic = italic_c },
		SpecialComment = { fg = p.fg_dim, italic = italic_c },

		-- ── Constants / literals ──
		Constant = { fg = p.amber },
		String = { fg = p.mint },
		Character = { fg = p.mint },
		Number = { fg = p.amber },
		Float = { fg = p.amber },
		Boolean = { fg = p.amber },

		-- ── Identifiers / functions ──
		Identifier = { fg = p.fg },
		Function = { fg = p.amber_br },

		-- ── Statements / keywords ──
		Statement = { fg = p.fg_bright, bold = kw_bold },
		Conditional = { fg = p.fg_bright, bold = kw_bold },
		Repeat = { fg = p.fg_bright, bold = kw_bold },
		Label = { fg = p.fg_bright, bold = kw_bold },
		Operator = { fg = p.fg_dim },
		Keyword = { fg = p.fg_bright, bold = kw_bold },
		Exception = { fg = p.red, bold = true },

		-- ── Preprocessor ──
		PreProc = { fg = p.sky },
		Include = { fg = p.sky },
		Define = { fg = p.sky },
		Macro = { fg = p.sky },
		PreCondit = { fg = p.sky },

		-- ── Types ──
		Type = { fg = p.amber },
		StorageClass = { fg = p.fg_bright, bold = kw_bold },
		Structure = { fg = p.amber },
		Typedef = { fg = p.amber },

		-- ── Specials ──
		Special = { fg = p.amber_br },
		SpecialChar = { fg = p.amber_br },
		Tag = { fg = p.sky },
		Delimiter = { fg = p.fg_dim },
		Debug = { fg = p.amber },

		-- ── Misc ──
		Underlined = { underline = true },
		Ignore = { fg = p.comment },
		Error = { fg = p.red, bold = true },
		Todo = { fg = p.amber_br, bold = true },
	}
end

return M
