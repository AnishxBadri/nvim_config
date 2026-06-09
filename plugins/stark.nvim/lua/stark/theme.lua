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

	-- ── nvim-cmp ───────────────────────────────────────────────────────────────
	hi("CmpItemAbbr", { fg = p.fg })
	hi("CmpItemAbbrDeprecated", { fg = p.fg_dim, strikethrough = true })
	hi("CmpItemAbbrMatch", { fg = p.sky, bold = true })
	hi("CmpItemAbbrMatchFuzzy", { fg = p.sky })
	hi("CmpItemMenu", { fg = p.fg_dim, italic = true })
	hi("CmpItemKindDefault", { fg = p.fg_dim })
	hi("CmpItemKindText", { fg = p.fg })
	hi("CmpItemKindKeyword", { fg = p.fg_bright })
	hi("CmpItemKindVariable", { fg = p.fg })
	hi("CmpItemKindConstant", { fg = p.amber })
	hi("CmpItemKindReference", { fg = p.rose })
	hi("CmpItemKindValue", { fg = p.amber })
	hi("CmpItemKindFunction", { fg = p.amber_br })
	hi("CmpItemKindMethod", { fg = p.amber_br })
	hi("CmpItemKindConstructor", { fg = p.amber_br })
	hi("CmpItemKindClass", { fg = p.amber })
	hi("CmpItemKindInterface", { fg = p.amber })
	hi("CmpItemKindStruct", { fg = p.amber })
	hi("CmpItemKindEvent", { fg = p.sky })
	hi("CmpItemKindEnum", { fg = p.amber })
	hi("CmpItemKindUnit", { fg = p.amber })
	hi("CmpItemKindModule", { fg = p.fg_bright })
	hi("CmpItemKindProperty", { fg = p.mint })
	hi("CmpItemKindField", { fg = p.mint })
	hi("CmpItemKindTypeParameter", { fg = p.amber })
	hi("CmpItemKindEnumMember", { fg = p.amber })
	hi("CmpItemKindOperator", { fg = p.fg_dim })
	hi("CmpItemKindSnippet", { fg = p.sky })
	hi("CmpItemKindColor", { fg = p.rose })
	hi("CmpItemKindFile", { fg = p.fg_dim })
	hi("CmpItemKindFolder", { fg = p.sky })

	-- ── neo-tree ───────────────────────────────────────────────────────────────
	hi("NeoTreeNormal", { fg = p.fg, bg = p.bg_code })
	hi("NeoTreeNormalNC", { fg = p.fg, bg = p.bg_code })
	hi("NeoTreeEndOfBuffer", { fg = p.bg_code, bg = p.bg_code })
	hi("NeoTreeRootName", { fg = p.fg_bright, bold = true })
	hi("NeoTreeDirectoryName", { fg = p.fg })
	hi("NeoTreeDirectoryIcon", { fg = p.sky })
	hi("NeoTreeFileName", { fg = p.fg })
	hi("NeoTreeFileNameOpened", { fg = p.mint, italic = true })
	hi("NeoTreeFileIcon", { fg = p.fg_dim })
	hi("NeoTreeSymbolicLinkTarget", { fg = p.amber_br, italic = true })
	hi("NeoTreeGitAdded", { fg = p.mint })
	hi("NeoTreeGitConflict", { fg = p.red, bold = true })
	hi("NeoTreeGitDeleted", { fg = p.red })
	hi("NeoTreeGitIgnored", { fg = p.comment })
	hi("NeoTreeGitModified", { fg = p.amber })
	hi("NeoTreeGitUnstaged", { fg = p.amber })
	hi("NeoTreeGitUntracked", { fg = p.fg_dim })
	hi("NeoTreeGitStaged", { fg = p.mint })
	hi("NeoTreeIndentMarker", { fg = p.gray })
	hi("NeoTreeExpander", { fg = p.fg_dim })
	hi("NeoTreeTabActive", { fg = p.fg_bright, bg = p.bg, bold = true })
	hi("NeoTreeTabInactive", { fg = p.fg_dim, bg = p.bg_code })
	hi("NeoTreeTabSeparatorActive", { fg = p.bg, bg = p.bg })
	hi("NeoTreeTabSeparatorInactive", { fg = p.bg_code, bg = p.bg_code })
	hi("NeoTreeWinSeparator", { fg = p.gray, bg = p.bg_code })

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

	-- ── gitsigns ───────────────────────────────────────────────────────────────
	hi("GitSignsAdd", { fg = p.mint })
	hi("GitSignsChange", { fg = p.amber })
	hi("GitSignsDelete", { fg = p.red })
	hi("GitSignsTopDelete", { fg = p.red })
	hi("GitSignsChangeDelete", { fg = p.amber })
	hi("GitSignsUntracked", { fg = p.fg_dim })
	hi("GitSignsAddNr", { fg = p.mint })
	hi("GitSignsChangeNr", { fg = p.amber })
	hi("GitSignsDeleteNr", { fg = p.red })
	hi("GitSignsAddLn", { bg = p.diff_add })
	hi("GitSignsChangeLn", { bg = p.diff_chg })
	hi("GitSignsDeleteLn", { bg = p.diff_del })
	hi("GitSignsAddInline", { fg = p.mint, bg = p.diff_add, bold = true })
	hi("GitSignsChangeInline", { fg = p.amber_br, bg = p.diff_txt, bold = true })
	hi("GitSignsDeleteInline", { fg = p.red, bg = p.diff_del, bold = true })

	-- ── lazy.nvim ──────────────────────────────────────────────────────────────
	hi("LazyH1", { fg = p.bg, bg = p.mint, bold = true })
	hi("LazyH2", { fg = p.fg_bright, bold = true })
	hi("LazyButton", { fg = p.fg, bg = p.bg_code })
	hi("LazyButtonActive", { fg = p.bg, bg = p.sky, bold = true })
	hi("LazySpecial", { fg = p.sky })
	hi("LazyReasonPlugin", { fg = p.sky })
	hi("LazyReasonEvent", { fg = p.amber })
	hi("LazyReasonKeys", { fg = p.mint })
	hi("LazyReasonCmd", { fg = p.sky })
	hi("LazyReasonFt", { fg = p.amber })
	hi("LazyProgressDone", { fg = p.mint })
	hi("LazyProgressTodo", { fg = p.fg_dim })
	hi("LazyNoCond", { fg = p.comment })
	hi("LazyDimmed", { fg = p.comment })
	hi("LazyProp", { fg = p.mint })
	hi("LazyValue", { fg = p.amber })
	hi("LazyUrl", { fg = p.sky, underline = true })
	hi("LazyCommit", { fg = p.mint })
	hi("LazyCommitType", { fg = p.sky })
	hi("LazyCommitScope", { fg = p.rose })

	-- ── snacks.nvim ────────────────────────────────────────────────────────────
	hi("SnacksPickerBorder", { fg = p.gray, bg = p.bg_code })
	hi("SnacksPickerTitle", { fg = p.bg, bg = p.sky, bold = true })
	hi("SnacksPickerPreviewTitle", { fg = p.bg, bg = p.mint, bold = true })
	hi("SnacksPickerInputTitle", { fg = p.bg, bg = p.sky, bold = true })
	hi("SnacksPickerNormal", { fg = p.fg, bg = p.bg_code })
	hi("SnacksPickerPreview", { fg = p.fg, bg = p.bg })
	hi("SnacksPickerPrompt", { fg = p.sky })
	hi("SnacksPickerSearch", { fg = p.amber_br, bold = true })
	hi("SnacksPickerMatch", { fg = p.sky, bold = true })
	hi("SnacksPickerSelected", { fg = p.mint })
	hi("SnacksPickerDir", { fg = p.fg_dim })
	hi("SnacksDashboardHeader", { fg = p.mint })
	hi("SnacksDashboardFooter", { fg = p.comment, italic = true })
	hi("SnacksDashboardDesc", { fg = p.fg })
	hi("SnacksDashboardKey", { fg = p.sky })
	hi("SnacksDashboardAction", { fg = p.sky })
	hi("SnacksDashboardSpecial", { fg = p.rose })
	hi("SnacksDashboardDir", { fg = p.fg_dim })
	hi("SnacksNotifierInfo", { fg = p.sky })
	hi("SnacksNotifierWarn", { fg = p.amber })
	hi("SnacksNotifierError", { fg = p.red })
	hi("SnacksNotifierDebug", { fg = p.comment })
	hi("SnacksNotifierTrace", { fg = p.sky_br })
	hi("SnacksNotifierBorderInfo", { fg = p.sky })
	hi("SnacksNotifierBorderWarn", { fg = p.amber })
	hi("SnacksNotifierBorderError", { fg = p.red })
	hi("SnacksNotifierBorderDebug", { fg = p.comment })
	hi("SnacksNotifierBorderTrace", { fg = p.sky_br })
	hi("SnacksIndent", { fg = p.gray })
	hi("SnacksIndentScope", { fg = p.fg_dim })
	hi("SnacksWordUnderCursor", { bg = p.bg_hover })

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
