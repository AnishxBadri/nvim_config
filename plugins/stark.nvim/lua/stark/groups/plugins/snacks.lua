local M = {}

function M.get(p, cfg)
	return {
		-- ── Picker ──
		SnacksPickerBorder = { fg = p.gray, bg = p.bg_code },
		SnacksPickerTitle = { fg = p.bg, bg = p.sky, bold = true },
		SnacksPickerPreviewTitle = { fg = p.bg, bg = p.mint, bold = true },
		SnacksPickerInputTitle = { fg = p.bg, bg = p.sky, bold = true },
		SnacksPickerNormal = { fg = p.fg, bg = p.bg_code },
		SnacksPickerPreview = { fg = p.fg, bg = p.bg },
		SnacksPickerPrompt = { fg = p.sky },
		SnacksPickerSearch = { fg = p.amber_br, bold = true },
		SnacksPickerMatch = { fg = p.sky, bold = true },
		SnacksPickerSelected = { fg = p.mint },
		SnacksPickerDir = { fg = p.fg_dim },

		-- ── Dashboard ──
		SnacksDashboardHeader = { fg = p.mint },
		SnacksDashboardFooter = { fg = p.comment, italic = true },
		SnacksDashboardDesc = { fg = p.fg },
		SnacksDashboardKey = { fg = p.sky },
		SnacksDashboardAction = { fg = p.sky },
		SnacksDashboardSpecial = { fg = p.rose },
		SnacksDashboardDir = { fg = p.fg_dim },

		-- ── Notifier ──
		SnacksNotifierInfo = { fg = p.sky },
		SnacksNotifierWarn = { fg = p.amber },
		SnacksNotifierError = { fg = p.red },
		SnacksNotifierDebug = { fg = p.comment },
		SnacksNotifierTrace = { fg = p.sky_br },
		SnacksNotifierBorderInfo = { fg = p.sky },
		SnacksNotifierBorderWarn = { fg = p.amber },
		SnacksNotifierBorderError = { fg = p.red },
		SnacksNotifierBorderDebug = { fg = p.comment },
		SnacksNotifierBorderTrace = { fg = p.sky_br },

		-- ── Indent / cursor ──
		SnacksIndent = { fg = p.gray },
		SnacksIndentScope = { fg = p.fg_dim },
		SnacksWordUnderCursor = { bg = p.bg_hover },
	}
end

return M
