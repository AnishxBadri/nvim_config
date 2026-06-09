local M = {}

function M.get(p, cfg)
	return {
		NeoTreeNormal = { fg = p.fg, bg = p.bg_code },
		NeoTreeNormalNC = { fg = p.fg, bg = p.bg_code },
		NeoTreeEndOfBuffer = { fg = p.bg_code, bg = p.bg_code },
		NeoTreeRootName = { fg = p.fg_bright, bold = true },
		NeoTreeDirectoryName = { fg = p.fg },
		NeoTreeDirectoryIcon = { fg = p.sky },
		NeoTreeFileName = { fg = p.fg },
		NeoTreeFileNameOpened = { fg = p.mint, italic = true },
		NeoTreeFileIcon = { fg = p.fg_dim },
		NeoTreeSymbolicLinkTarget = { fg = p.amber_br, italic = true },

		-- ── Git status ──
		NeoTreeGitAdded = { fg = p.mint },
		NeoTreeGitConflict = { fg = p.red, bold = true },
		NeoTreeGitDeleted = { fg = p.red },
		NeoTreeGitIgnored = { fg = p.comment },
		NeoTreeGitModified = { fg = p.amber },
		NeoTreeGitUnstaged = { fg = p.amber },
		NeoTreeGitUntracked = { fg = p.fg_dim },
		NeoTreeGitStaged = { fg = p.mint },

		-- ── Indent / expander ──
		NeoTreeIndentMarker = { fg = p.gray },
		NeoTreeExpander = { fg = p.fg_dim },

		-- ── Tabs ──
		NeoTreeTabActive = { fg = p.fg_bright, bg = p.bg, bold = true },
		NeoTreeTabInactive = { fg = p.fg_dim, bg = p.bg_code },
		NeoTreeTabSeparatorActive = { fg = p.bg, bg = p.bg },
		NeoTreeTabSeparatorInactive = { fg = p.bg_code, bg = p.bg_code },
		NeoTreeWinSeparator = { fg = p.gray, bg = p.bg_code },
	}
end

return M
