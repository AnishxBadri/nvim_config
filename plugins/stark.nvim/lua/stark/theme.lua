local M = {}

local CORE = {
	"editor",
	"syntax",
	"treesitter",
	"lsp",
	"markdown",
}

local PLUGINS = {
	"telescope",
	"snacks",
	"neo-tree",
	"cmp",
	"gitsigns",
	"lazy",
}

function M.load()
	local cfg = require("stark.config").options
	local p = vim.deepcopy(require("stark.palette"))
	cfg.on_colors(p)

	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "stark"

	local italic_c = cfg.italic_comments or nil
	local italic_imp = cfg.italic_imports or nil
	local kw_bold = cfg.bold_keywords or nil

	local hl = {}
	local hi = function(group, opts)
		hl[group] = opts
	end

	-- ── which-key ──────────────────────────────────────────────────────────────
	hi("WhichKey", { fg = p.sky })
	hi("WhichKeyGroup", { fg = p.mint, bold = true })
	hi("WhichKeyDesc", { fg = p.fg })
	hi("WhichKeySeperator", { fg = p.comment })
	hi("WhichKeySeparator", { fg = p.comment })
	hi("WhichKeyFloat", { bg = p.bg_code })
	hi("WhichKeyBorder", { fg = p.gray, bg = p.bg_code })
	hi("WhichKeyValue", { fg = p.fg_dim })
	hi("WhichKeyTitle", { fg = p.fg_bright, bold = true })

	-- ── nvim-notify ────────────────────────────────────────────────────────────
	hi("NotifyERRORBorder", { fg = p.red })
	hi("NotifyWARNBorder", { fg = p.amber })
	hi("NotifyINFOBorder", { fg = p.sky })
	hi("NotifyDEBUGBorder", { fg = p.comment })
	hi("NotifyTRACEBorder", { fg = p.sky_br })
	hi("NotifyERRORIcon", { fg = p.red })
	hi("NotifyWARNIcon", { fg = p.amber })
	hi("NotifyINFOIcon", { fg = p.sky })
	hi("NotifyDEBUGIcon", { fg = p.comment })
	hi("NotifyTRACEIcon", { fg = p.sky_br })
	hi("NotifyERRORTitle", { fg = p.red, bold = true })
	hi("NotifyWARNTitle", { fg = p.amber, bold = true })
	hi("NotifyINFOTitle", { fg = p.sky, bold = true })
	hi("NotifyDEBUGTitle", { fg = p.fg_dim, bold = true })
	hi("NotifyTRACETitle", { fg = p.sky_br, bold = true })
	hi("NotifyERRORBody", { fg = p.fg, bg = p.bg_code })
	hi("NotifyWARNBody", { fg = p.fg, bg = p.bg_code })
	hi("NotifyINFOBody", { fg = p.fg, bg = p.bg_code })
	hi("NotifyDEBUGBody", { fg = p.fg, bg = p.bg_code })
	hi("NotifyTRACEBody", { fg = p.fg, bg = p.bg_code })

	-- ── indent-blankline ───────────────────────────────────────────────────────
	hi("IblIndent", { fg = p.gray })
	hi("IblScope", { fg = p.fg_dim })
	hi("IblWhitespace", { fg = p.gray })
	hi("IndentBlanklineChar", { fg = p.gray })
	hi("IndentBlanklineContextChar", { fg = p.fg_dim })
	hi("IndentBlanklineContextStart", { underline = true, sp = p.fg_dim })

	-- ── mini.nvim ──────────────────────────────────────────────────────────────
	hi("MiniStatuslineModeNormal", { fg = p.bg, bg = p.mint, bold = true })
	hi("MiniStatuslineModeInsert", { fg = p.bg, bg = p.sky, bold = true })
	hi("MiniStatuslineModeVisual", { fg = p.bg, bg = p.rose, bold = true })
	hi("MiniStatuslineModeReplace", { fg = p.bg, bg = p.red, bold = true })
	hi("MiniStatuslineModeCommand", { fg = p.bg, bg = p.amber, bold = true })
	hi("MiniStatuslineModeOther", { fg = p.bg, bg = p.gray, bold = true })
	hi("MiniStatuslineFilename", { fg = p.fg, bg = p.bg_code })
	hi("MiniStatuslineFileinfo", { fg = p.fg_dim, bg = p.bg_code })
	hi("MiniStatuslineDevinfo", { fg = p.fg_dim, bg = p.bg_code })
	hi("MiniStatuslineInactive", { fg = p.fg_dim, bg = p.bg_code })
	hi("MiniCursorword", { bg = p.bg_hover })
	hi("MiniCursorwordCurrent", { bg = p.bg_hover, underline = true })
	hi("MiniIndentscopeSymbol", { fg = p.fg_dim })
	hi("MiniIndentscopePrefix", { nocombine = true })
	hi("MiniPickMatchCurrent", { fg = p.fg_bright, bg = p.bg_hover })
	hi("MiniPickMatchRanges", { fg = p.sky, bold = true })
	hi("MiniPickBorder", { fg = p.gray, bg = p.bg_code })
	hi("MiniPickBorderBusy", { fg = p.amber, bg = p.bg_code })
	hi("MiniPickBorderText", { fg = p.sky, bg = p.bg_code, bold = true })
	hi("MiniPickNormal", { fg = p.fg, bg = p.bg_code })
	hi("MiniPickPrompt", { fg = p.sky, bg = p.bg_code, bold = true })
	hi("MiniPickHeader", { fg = p.rose, bold = true })
	hi("MiniPickIconDirectory", { fg = p.sky })
	hi("MiniPickIconFile", { fg = p.fg_dim })
	hi("MiniDiffSignAdd", { fg = p.mint })
	hi("MiniDiffSignChange", { fg = p.amber })
	hi("MiniDiffSignDelete", { fg = p.red })
	hi("MiniDiffOverAdd", { bg = p.diff_add })
	hi("MiniDiffOverChange", { bg = p.diff_chg })
	hi("MiniDiffOverDelete", { bg = p.diff_del })
	hi("MiniDiffOverContext", { bg = p.bg_code })
	hi("MiniJump", { fg = p.bg, bg = p.amber_br })
	hi("MiniJump2dSpot", { fg = p.amber_br, bold = true, nocombine = true })
	hi("MiniJump2dSpotAhead", { fg = p.mint, nocombine = true })
	hi("MiniJump2dSpotUnique", { fg = p.amber, bold = true, nocombine = true })
	hi("MiniHipatternsFixme", { fg = p.bg, bg = p.red, bold = true })
	hi("MiniHipatternsTodo", { fg = p.bg, bg = p.amber_br, bold = true })
	hi("MiniHipatternsNote", { fg = p.bg, bg = p.sky, bold = true })
	hi("MiniHipatternsHack", { fg = p.bg, bg = p.amber, bold = true })

	-- ── Merge core group files ─────────────────────────────────────────────────
	for _, name in ipairs(CORE) do
		for k, v in pairs(require("stark.groups." .. name).get(p, cfg)) do
			hl[k] = v
		end
	end

	-- ── Merge plugin group files (gated by cfg.plugins) ────────────────────────
	for _, name in ipairs(PLUGINS) do
		if cfg.plugins[name] then
			for k, v in pairs(require("stark.groups.plugins." .. name).get(p, cfg)) do
				hl[k] = v
			end
		end
	end

	-- ── User overrides ─────────────────────────────────────────────────────────
	cfg.on_highlights(hl, p)

	-- ── Apply ──────────────────────────────────────────────────────────────────
	for k, v in pairs(hl) do
		vim.api.nvim_set_hl(0, k, v)
	end

	-- ── Terminal colors (mirrors stark ghostty palette) ────────────────────────
	vim.g.terminal_color_0 = p.black
	vim.g.terminal_color_1 = p.red
	vim.g.terminal_color_2 = p.mint
	vim.g.terminal_color_3 = p.amber
	vim.g.terminal_color_4 = p.mint
	vim.g.terminal_color_5 = p.sky
	vim.g.terminal_color_6 = p.amber
	vim.g.terminal_color_7 = p.fg
	vim.g.terminal_color_8 = p.gray
	vim.g.terminal_color_9 = p.red_br
	vim.g.terminal_color_10 = p.mint_br
	vim.g.terminal_color_11 = p.amber_br
	vim.g.terminal_color_12 = p.mint_br
	vim.g.terminal_color_13 = p.sky_br
	vim.g.terminal_color_14 = p.amber_br
	vim.g.terminal_color_15 = p.fg_bright
end

return M
