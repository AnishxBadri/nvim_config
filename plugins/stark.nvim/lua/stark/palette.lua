return {
	-- ── Backgrounds (canvas → selection ramp) ────────────────────────────────
	bg = "#0d0d0d", -- editor canvas
	bg_subtle = "#161616", -- cursorline, very subtle highlight
	bg_code = "#111111", -- sidebars, floats, statusline
	bg_hover = "#1e1e1e", -- pmenu sel, active list item
	bg_select = "#2a2a2a", -- visual selection

	-- ── Foregrounds (greyscale ramp) ─────────────────────────────────────────
	gray = "#3a3a3a", -- indent guides, separators
	comment = "#585858", -- comments, folds
	fg_dim = "#8a8a8a", -- line numbers, operators, inactive UI
	fg = "#d4d4d4", -- normal text
	fg_bright = "#ead8b6", -- warm bone — emphasized text, bold keywords

	-- ── Accents ──────────────────────────────────────────────────────────────
	black = "#0a0a0a", -- terminal slot 0
	red = "#f5425d", -- errors, deletions, exceptions
	mint = "#00CF9C", -- strings, additions, success, split divider
	amber = "#f59e0b", -- types, warnings, numbers, modified
	sky = "#38bdf8", -- decorators, attributes, special files, links

	-- ── Bright variants ──────────────────────────────────────────────────────
	red_br = "#ff6b6b", -- bold errors, urgent diagnostics
	mint_br = "#2EDBA6", -- bold strings, active success
	amber_br = "#fbbf24", -- functions, search, todo, regex/escapes
	sky_br = "#7dd3fc", -- bold decorators, hover links

	-- ── Syntax extensions ────────────────────────────────────────────────────
	rose = "#fb7185", -- parameters, self/this, html attrs
	teal = "#5eead4", -- regex, escapes, special chars

	-- ── Diff tint backgrounds (~8% accent on bg) ─────────────────────────────
	diff_add = "#0d2818", -- mint tint
	diff_chg = "#261a06", -- amber tint
	diff_del = "#2a0d10", -- red tint
	diff_txt = "#332209", -- amber_br tint
}
