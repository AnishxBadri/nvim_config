local M = {}

function M.get(p, cfg)
	return {
		-- ── Borders ──
		NotifyERRORBorder = { fg = p.red },
		NotifyWARNBorder = { fg = p.amber },
		NotifyINFOBorder = { fg = p.sky },
		NotifyDEBUGBorder = { fg = p.comment },
		NotifyTRACEBorder = { fg = p.sky_br },

		-- ── Icons ──
		NotifyERRORIcon = { fg = p.red },
		NotifyWARNIcon = { fg = p.amber },
		NotifyINFOIcon = { fg = p.sky },
		NotifyDEBUGIcon = { fg = p.comment },
		NotifyTRACEIcon = { fg = p.sky_br },

		-- ── Titles ──
		NotifyERRORTitle = { fg = p.red, bold = true },
		NotifyWARNTitle = { fg = p.amber, bold = true },
		NotifyINFOTitle = { fg = p.sky, bold = true },
		NotifyDEBUGTitle = { fg = p.fg_dim, bold = true },
		NotifyTRACETitle = { fg = p.sky_br, bold = true },

		-- ── Bodies ──
		NotifyERRORBody = { fg = p.fg, bg = p.bg_code },
		NotifyWARNBody = { fg = p.fg, bg = p.bg_code },
		NotifyINFOBody = { fg = p.fg, bg = p.bg_code },
		NotifyDEBUGBody = { fg = p.fg, bg = p.bg_code },
		NotifyTRACEBody = { fg = p.fg, bg = p.bg_code },
	}
end

return M
