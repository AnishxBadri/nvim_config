local M = {}

function M.get(p, cfg)
	local bg = cfg.transparent and "NONE" or p.bg

	return {
		-- ── Normal ──
		Normal = { fg = p.fg, bg = bg },
		NormalNC = { fg = p.fg, bg = bg },
		NormalFloat = { fg = p.fg, bg = p.bg_code },
		FloatBorder = { fg = p.fg_dim, bg = p.bg_code },
		FloatTitle = { fg = p.fg_bright, bg = p.bg_code, bold = true },
		FloatFooter = { fg = p.fg_dim, bg = p.bg_code },

		-- ── Cursor / line numbers ──
		ColorColumn = { bg = p.bg_code },
		CursorLine = { bg = p.bg_subtle },
		CursorColumn = { bg = p.bg_subtle },
		CursorLineNr = { fg = p.fg_bright, bold = true },
		LineNr = { fg = p.fg_dim },
		LineNrAbove = { fg = p.fg_dim },
		LineNrBelow = { fg = p.fg_dim },

		-- ── Sign / fold columns ──
		SignColumn = { fg = p.fg_dim, bg = bg },
		FoldColumn = { fg = p.fg_dim, bg = bg },
		Folded = { fg = p.fg_dim, bg = p.bg_code, italic = true },

		-- ── Splits ──
		VertSplit = { fg = p.mint, bg = bg },
		WinSeparator = { fg = p.mint, bg = bg },

		-- ── Statusline ──
		StatusLine = { fg = p.fg, bg = p.bg_code },
		StatusLineNC = { fg = p.fg_dim, bg = p.bg_code },

		-- ── Tabline ──
		TabLine = { fg = p.fg_dim, bg = p.bg_code },
		TabLineFill = { bg = p.bg_code },
		TabLineSel = { fg = p.fg_bright, bg = p.bg, bold = true },

		-- ── Pmenu ──
		Pmenu = { fg = p.fg, bg = p.bg_code },
		PmenuSel = { fg = p.fg_bright, bg = p.bg_hover, bold = true },
		PmenuSbar = { bg = p.bg_hover },
		PmenuThumb = { bg = p.fg_dim },
		PmenuExtra = { fg = p.fg_dim, bg = p.bg_code },
		PmenuExtraSel = { fg = p.fg_dim, bg = p.bg_hover },
		PmenuKind = { fg = p.sky, bg = p.bg_code },
		PmenuKindSel = { fg = p.sky, bg = p.bg_hover },

		-- ── Misc UI ──
		WildMenu = { fg = p.fg_bright, bg = p.bg_hover },
		EndOfBuffer = { fg = p.bg_hover },
		NonText = { fg = p.bg_hover },
		SpecialKey = { fg = p.comment },
		Whitespace = { fg = p.bg_hover },
		Conceal = { fg = p.fg_dim },

		-- ── Visual / selection ──
		Visual = { bg = p.bg_select },
		VisualNOS = { bg = p.bg_select },
		SelectionHighlightBackground = { bg = p.bg_select },

		-- ── Search ──
		Search = { fg = p.bg, bg = p.amber_br },
		IncSearch = { fg = p.bg, bg = p.sky },
		CurSearch = { fg = p.bg, bg = p.mint },
		Substitute = { fg = p.bg, bg = p.red },

		-- ── Match / quickfix ──
		MatchParen = { fg = p.amber_br, bold = true, underline = true },
		QuickFixLine = { fg = p.amber_br, bold = true },
		qfLineNr = { fg = p.fg_dim },
		qfFileName = { fg = p.sky },

		-- ── Messages ──
		MsgArea = { fg = p.fg },
		MsgSeparator = { fg = p.comment },
		MoreMsg = { fg = p.mint, bold = true },
		Question = { fg = p.sky },
		WarningMsg = { fg = p.amber, bold = true },
		ErrorMsg = { fg = p.red, bold = true },

		-- ── Spell ──
		SpellBad = { undercurl = true, sp = p.red },
		SpellCap = { undercurl = true, sp = p.sky },
		SpellLocal = { undercurl = true, sp = p.mint },
		SpellRare = { undercurl = true, sp = p.sky_br },

		-- ── Titles / links ──
		Title = { fg = p.fg_bright, bold = true },
		Directory = { fg = p.sky },
		helpHyperTextJump = { fg = p.sky, underline = true },
		helpSectionDelim = { fg = p.comment },

		-- ── Diff ──
		DiffAdd = { fg = p.mint, bg = p.diff_add },
		DiffChange = { fg = p.amber, bg = p.diff_chg },
		DiffDelete = { fg = p.red, bg = p.diff_del },
		DiffText = { fg = p.amber_br, bg = p.diff_txt, bold = true },
		Added = { fg = p.mint },
		Changed = { fg = p.amber },
		Removed = { fg = p.red },
	}
end

return M
