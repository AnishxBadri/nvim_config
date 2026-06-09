local M = {}

function M.get(p, cfg)
	return {
		-- ── Statusline modes ──
		MiniStatuslineModeNormal = { fg = p.bg, bg = p.mint, bold = true },
		MiniStatuslineModeInsert = { fg = p.bg, bg = p.sky, bold = true },
		MiniStatuslineModeVisual = { fg = p.bg, bg = p.rose, bold = true },
		MiniStatuslineModeReplace = { fg = p.bg, bg = p.red, bold = true },
		MiniStatuslineModeCommand = { fg = p.bg, bg = p.amber, bold = true },
		MiniStatuslineModeOther = { fg = p.bg, bg = p.gray, bold = true },
		MiniStatuslineFilename = { fg = p.fg, bg = p.bg_code },
		MiniStatuslineFileinfo = { fg = p.fg_dim, bg = p.bg_code },
		MiniStatuslineDevinfo = { fg = p.fg_dim, bg = p.bg_code },
		MiniStatuslineInactive = { fg = p.fg_dim, bg = p.bg_code },

		-- ── Cursorword ──
		MiniCursorword = { bg = p.bg_hover },
		MiniCursorwordCurrent = { bg = p.bg_hover, underline = true },

		-- ── Indentscope ──
		MiniIndentscopeSymbol = { fg = p.fg_dim },
		MiniIndentscopePrefix = { nocombine = true },

		-- ── Picker ──
		MiniPickMatchCurrent = { fg = p.fg_bright, bg = p.bg_hover },
		MiniPickMatchRanges = { fg = p.sky, bold = true },
		MiniPickBorder = { fg = p.gray, bg = p.bg_code },
		MiniPickBorderBusy = { fg = p.amber, bg = p.bg_code },
		MiniPickBorderText = { fg = p.sky, bg = p.bg_code, bold = true },
		MiniPickNormal = { fg = p.fg, bg = p.bg_code },
		MiniPickPrompt = { fg = p.sky, bg = p.bg_code, bold = true },
		MiniPickHeader = { fg = p.rose, bold = true },
		MiniPickIconDirectory = { fg = p.sky },
		MiniPickIconFile = { fg = p.fg_dim },

		-- ── Diff ──
		MiniDiffSignAdd = { fg = p.mint },
		MiniDiffSignChange = { fg = p.amber },
		MiniDiffSignDelete = { fg = p.red },
		MiniDiffOverAdd = { bg = p.diff_add },
		MiniDiffOverChange = { bg = p.diff_chg },
		MiniDiffOverDelete = { bg = p.diff_del },
		MiniDiffOverContext = { bg = p.bg_code },

		-- ── Jump ──
		MiniJump = { fg = p.bg, bg = p.amber_br },
		MiniJump2dSpot = { fg = p.amber_br, bold = true, nocombine = true },
		MiniJump2dSpotAhead = { fg = p.mint, nocombine = true },
		MiniJump2dSpotUnique = { fg = p.amber, bold = true, nocombine = true },

		-- ── Hipatterns ──
		MiniHipatternsFixme = { fg = p.bg, bg = p.red, bold = true },
		MiniHipatternsTodo = { fg = p.bg, bg = p.amber_br, bold = true },
		MiniHipatternsNote = { fg = p.bg, bg = p.sky, bold = true },
		MiniHipatternsHack = { fg = p.bg, bg = p.amber, bold = true },
	}
end

return M
