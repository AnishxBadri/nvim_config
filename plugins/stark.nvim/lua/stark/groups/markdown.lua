local M = {}

function M.get(p, cfg)
	return {
		-- ── Text styles ──
		["@markup.strong"] = { fg = p.fg_bright, bold = true },
		["@markup.italic"] = { fg = p.fg, italic = true },
		["@markup.strikethrough"] = { fg = p.fg_dim, strikethrough = true },
		["@markup.underline"] = { underline = true },

		-- ── Headings (6 levels) ──
		["@markup.heading.1"] = { fg = p.sky, bold = true },
		["@markup.heading.2"] = { fg = p.mint, bold = true },
		["@markup.heading.3"] = { fg = p.mint_br, bold = true },
		["@markup.heading.4"] = { fg = p.amber_br, bold = true },
		["@markup.heading.5"] = { fg = p.amber, bold = true },
		["@markup.heading.6"] = { fg = p.rose, bold = true },

		-- ── Quote / math ──
		["@markup.quote"] = { fg = p.fg_dim, italic = true },
		["@markup.math"] = { fg = p.amber_br },

		-- ── Links ──
		["@markup.link"] = { fg = p.sky, underline = true },
		["@markup.link.label"] = { fg = p.mint },
		["@markup.link.url"] = { fg = p.sky, underline = true },

		-- ── Code blocks ──
		["@markup.raw"] = { fg = p.mint, bg = p.bg_code },
		["@markup.raw.block"] = { fg = p.mint, bg = p.bg_code },

		-- ── Lists ──
		["@markup.list"] = { fg = p.fg_dim },
		["@markup.list.checked"] = { fg = p.mint },
		["@markup.list.unchecked"] = { fg = p.fg_dim },
	}
end

return M
