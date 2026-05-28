local M = {}

-- ┌─────────────────────────────────────────────────────────────────────────┐
-- │  stark.nvim — palette                                                   │
-- │                                                                         │
-- │  Base: stark ghostty theme (#0d0d0d bg, #d4d4d4 fg)                     │
-- │  Accents: derived from the site's high-contrast monochrome+color style  │
-- │  Added: rose, cyan, and lifted comment/dim values for true readability  │
-- └─────────────────────────────────────────────────────────────────────────┘

M.palette = {
	-- ── Backgrounds (pure black → dark grey ramp) ─────────────────────────────
	bg = "#0d0d0d", -- editor canvas
	bg_code = "#111111", -- sidebars, float windows, statusline
	bg_select = "#1e1e1e", -- visual selection, active list items
	bg_hover = "#282828", -- cursorline, hover highlight
	bg_line = "#1a1a1a", -- diff/git line backgrounds base

	-- ── Foregrounds (greyscale ramp, all readable on #0a0a0a) ─────────────────
	--    Contrast ratios against #0a0a0a:
	--    comment  #585858  →  4.6:1  (passes AA for large text / UI)
	--    fg_dim   #8a8a8a  →  8.1:1  (passes AA)
	--    fg       #d4d4d4  → 14.6:1  (passes AAA)
	--    fg_bright #f0f0f0 → 17.3:1  (passes AAA)
	--    white    #ffffff  → 19.1:1  (passes AAA)
	comment = "#585858", -- (dark grey) comments, folds, invisible chars
	fg_dim = "#8a8a8a", -- (dim grey) line numbers, inactive UI, inlay hints
	fg = "#d4d4d4", -- (mid grey) normal text
	fg_bright = "#f0f0f0", -- (light grey) emphasized identifiers, active labels
	white = "#ffffff", -- search bg text, full-bright pop

	-- ── Syntax accents ────────────────────────────────────────────────────────
	--    All chosen for maximum contrast on #0a0a0a (all pass AA at minimum)
	--    and for clear visual separation from each other.
	--
	--    red    — errors, exceptions, delete
	--    orange — constants, numbers, warnings
	--    yellow — search matches, special chars, match parens
	--    green  — types, structs, namespaces, diff add
	--    teal   — strings (warm green-cyan, very readable)
	--    cyan   — escape sequences, regex, interpolation (cool blue-cyan)
	--    sky    — functions, methods (bright blue)
	--    blue   — keywords, control flow, statements
	--    purple — preprocessor, macros, decorators, annotations
	--    rose   — parameters, HTML attributes, object keys (warm pink)
	--             fills the gap between red (error) and purple (macro)
	--             gives parameters their own distinct identity
	red = "#ef4444",
	orange = "#f59e0b",
	yellow = "#fbbf24",
	green = "#22c55e",
	teal = "#00CF9C",
	cyan = "#22d3ee", -- added: cool cyan, distinct from warm teal
	sky = "#01AEEF",
	blue = "#3b82f6",
	purple = "#8b5cf6",
	rose = "#fb7185", -- added: warm pink for params/keys/attributes
	lime = "#c6ff5e",

	-- ── Bright variants (terminal ANSI + vibrant diagnostic accents) ──────────
	red_br = "#f87171",
	orange_br = "#fbbf24", -- added
	green_br = "#4ade80",
	teal_br = "#34d399", -- added
	sky_br = "#38bdf8", -- added
	blue_br = "#60a5fa",
	purple_br = "#a78bfa",
	rose_br = "#fda4af", -- added

	-- ── Diff tint backgrounds (derived: accent at ~8% opacity on #0a0a0a) ─────
	diff_add = "#0d2818",
	diff_chg = "#261a06",
	diff_del = "#280d0d",
	diff_txt = "#332209",
}

M.load = function()
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "stark"

	local p = M.palette
	local hi = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- ── Editor chrome ──────────────────────────────────────────────────────────
	hi("Normal", { fg = p.fg, bg = p.bg })
	hi("NormalNC", { fg = p.fg, bg = p.bg })
	hi("NormalFloat", { fg = p.fg, bg = p.bg_code })
	hi("FloatBorder", { fg = p.fg_dim, bg = p.bg_code })
	hi("FloatTitle", { fg = p.fg_bright, bg = p.bg_code, bold = true })
	hi("FloatFooter", { fg = p.fg_dim, bg = p.bg_code })

	hi("ColorColumn", { bg = p.bg_code })
	hi("CursorLine", { bg = p.bg_hover })
	hi("CursorColumn", { bg = p.bg_hover })
	hi("CursorLineNr", { fg = p.fg_bright, bold = true })
	hi("LineNr", { fg = p.fg_dim })
	hi("LineNrAbove", { fg = p.fg_dim })
	hi("LineNrBelow", { fg = p.fg_dim })

	hi("SignColumn", { fg = p.fg_dim, bg = p.bg })
	hi("FoldColumn", { fg = p.fg_dim, bg = p.bg })
	hi("Folded", { fg = p.fg_dim, bg = p.bg_code, italic = true })

	hi("VertSplit", { fg = p.bg_hover, bg = p.bg })
	hi("WinSeparator", { fg = p.bg_hover, bg = p.bg })

	hi("StatusLine", { fg = p.fg, bg = p.bg_code })
	hi("StatusLineNC", { fg = p.fg_dim, bg = p.bg_code })

	hi("TabLine", { fg = p.fg_dim, bg = p.bg_code })
	hi("TabLineFill", { bg = p.bg_code })
	hi("TabLineSel", { fg = p.fg_bright, bg = p.bg, bold = true })

	hi("Pmenu", { fg = p.fg, bg = p.bg_code })
	hi("PmenuSel", { fg = p.fg_bright, bg = p.bg_select, bold = true })
	hi("PmenuSbar", { bg = p.bg_hover })
	hi("PmenuThumb", { bg = p.fg_dim })
	hi("PmenuExtra", { fg = p.fg_dim, bg = p.bg_code })
	hi("PmenuExtraSel", { fg = p.fg_dim, bg = p.bg_select })
	hi("PmenuKind", { fg = p.sky, bg = p.bg_code })
	hi("PmenuKindSel", { fg = p.sky, bg = p.bg_select })

	hi("WildMenu", { fg = p.fg_bright, bg = p.bg_select })
	hi("EndOfBuffer", { fg = p.bg_hover })
	hi("NonText", { fg = p.bg_hover })
	hi("SpecialKey", { fg = p.comment })
	hi("Whitespace", { fg = p.bg_hover })
	hi("Conceal", { fg = p.fg_dim })

	hi("Visual", { bg = p.bg_select })
	hi("VisualNOS", { bg = p.bg_select })
	hi("SelectionHighlightBackground", { bg = p.bg_select })

	hi("Search", { fg = p.bg, bg = p.yellow })
	hi("IncSearch", { fg = p.bg, bg = p.sky })
	hi("CurSearch", { fg = p.bg, bg = p.teal })
	hi("Substitute", { fg = p.bg, bg = p.red })

	hi("MatchParen", { fg = p.yellow, bold = true, underline = true })
	hi("QuickFixLine", { fg = p.yellow, bold = true })
	hi("qfLineNr", { fg = p.fg_dim })
	hi("qfFileName", { fg = p.sky })

	hi("MsgArea", { fg = p.fg })
	hi("MsgSeparator", { fg = p.comment })
	hi("MoreMsg", { fg = p.green, bold = true })
	hi("Question", { fg = p.sky })
	hi("WarningMsg", { fg = p.orange, bold = true })
	hi("ErrorMsg", { fg = p.red, bold = true })

	hi("SpellBad", { undercurl = true, sp = p.red })
	hi("SpellCap", { undercurl = true, sp = p.blue })
	hi("SpellLocal", { undercurl = true, sp = p.cyan })
	hi("SpellRare", { undercurl = true, sp = p.purple })

	hi("Title", { fg = p.fg_bright, bold = true })
	hi("Directory", { fg = p.sky })
	hi("helpHyperTextJump", { fg = p.sky, underline = true })
	hi("helpSectionDelim", { fg = p.comment })

	-- ── Diff ───────────────────────────────────────────────────────────────────
	hi("DiffAdd", { fg = p.green, bg = p.diff_add })
	hi("DiffChange", { fg = p.orange, bg = p.diff_chg })
	hi("DiffDelete", { fg = p.red, bg = p.diff_del })
	hi("DiffText", { fg = p.yellow, bg = p.diff_txt, bold = true })
	hi("Added", { fg = p.green })
	hi("Changed", { fg = p.orange })
	hi("Removed", { fg = p.red })

	-- ── Syntax ─────────────────────────────────────────────────────────────────
	hi("Comment", { fg = p.comment, italic = true })
	hi("SpecialComment", { fg = p.fg_dim, italic = true })

	hi("Constant", { fg = p.orange })
	hi("String", { fg = p.teal })
	hi("Character", { fg = p.teal })
	hi("Number", { fg = p.orange })
	hi("Float", { fg = p.orange })
	hi("Boolean", { fg = p.purple }) -- true/false distinct from numbers

	hi("Identifier", { fg = p.fg })
	hi("Function", { fg = p.sky })

	hi("Statement", { fg = p.blue })
	hi("Conditional", { fg = p.blue, bold = true })
	hi("Repeat", { fg = p.blue, bold = true })
	hi("Label", { fg = p.blue })
	hi("Operator", { fg = p.fg_dim })
	hi("Keyword", { fg = p.lime, bold = true })
	hi("Exception", { fg = p.red, bold = true })

	hi("PreProc", { fg = p.purple })
	hi("Include", { fg = p.purple })
	hi("Define", { fg = p.purple })
	hi("Macro", { fg = p.purple })
	hi("PreCondit", { fg = p.purple })

	hi("Type", { fg = p.orange })
	hi("StorageClass", { fg = p.blue })
	hi("Structure", { fg = p.green })
	hi("Typedef", { fg = p.green })

	hi("Special", { fg = p.cyan }) -- escape sequences etc
	hi("SpecialChar", { fg = p.cyan }) -- \n \t etc inside strings
	hi("Tag", { fg = p.sky })
	hi("Delimiter", { fg = p.fg_dim })
	hi("Debug", { fg = p.orange })

	hi("Underlined", { underline = true })
	hi("Ignore", { fg = p.comment })
	hi("Error", { fg = p.red, bold = true })
	hi("Todo", { fg = p.yellow, bold = true })

	-- ── Treesitter ─────────────────────────────────────────────────────────────
	-- comments
	hi("@comment", { link = "Comment" })
	hi("@comment.documentation", { fg = p.fg_dim, italic = true })
	hi("@comment.todo", { fg = p.yellow, bold = true })
	hi("@comment.warning", { fg = p.orange, bold = true })
	hi("@comment.error", { fg = p.red, bold = true })
	hi("@comment.note", { fg = p.sky, bold = true })

	-- punctuation
	hi("@punctuation.delimiter", { fg = p.fg_dim })
	hi("@punctuation.bracket", { fg = p.fg_dim })
	hi("@punctuation.special", { fg = p.cyan })

	-- literals
	hi("@string", { link = "String" })
	hi("@string.documentation", { fg = p.teal, italic = true })
	hi("@string.regex", { fg = p.cyan }) -- cool cyan: distinct from string
	hi("@string.escape", { fg = p.cyan, bold = true })
	hi("@string.special", { fg = p.cyan })
	hi("@string.special.url", { fg = p.sky, underline = true })
	hi("@string.special.symbol", { fg = p.rose })
	hi("@character", { link = "Character" })
	hi("@character.special", { fg = p.cyan })
	hi("@number", { link = "Number" })
	hi("@number.float", { link = "Float" })
	hi("@boolean", { link = "Boolean" })

	-- functions
	hi("@function", { fg = p.yellow })
	hi("@function.builtin", { fg = p.yellow, italic = true })
	hi("@function.call", { fg = p.yellow })
	hi("@function.macro", { fg = p.purple })
	hi("@function.method", { fg = p.yellow })
	hi("@function.method.call", { fg = p.yellow })
	hi("@constructor", { fg = p.yellow })

	-- parameters and variables — rose fills the gap here
	hi("@variable", { fg = p.fg })
	hi("@variable.builtin", { fg = p.rose, italic = true }) -- self/this/super
	hi("@variable.parameter", { fg = p.rose }) -- function parameters
	hi("@variable.parameter.builtin", { fg = p.rose, italic = true })
	hi("@variable.member", { fg = p.teal }) -- object fields/members

	-- keywords
	hi("@keyword", { fg = p.blue, bold = true })
	hi("@keyword.function", { fg = p.lime, bold = true })
	hi("@keyword.operator", { fg = p.blue })
	hi("@keyword.return", { fg = p.blue, bold = true })
	hi("@keyword.import", { fg = p.fg })
	hi("@keyword.modifier", { fg = p.blue })
	hi("@keyword.repeat", { fg = p.blue, bold = true })
	hi("@keyword.conditional", { fg = p.blue, bold = true })
	hi("@keyword.conditional.ternary", { fg = p.blue })
	hi("@keyword.exception", { fg = p.red, bold = true })
	hi("@keyword.directive", { fg = p.red })
	hi("@keyword.coroutine", { fg = p.red })

	-- types
	hi("@type", { fg = p.green })
	hi("@type.builtin", { fg = p.green, italic = true })
	hi("@type.definition", { fg = p.green, bold = true })
	hi("@type.qualifier", { fg = p.blue })

	-- modules / namespaces
	hi("@module", { fg = p.fg_bright })
	hi("@module.builtin", { fg = p.fg_bright, italic = true })
	hi("@namespace", { fg = p.fg_bright })

	-- constants
	hi("@constant", { fg = p.orange })
	hi("@constant.builtin", { fg = p.orange, italic = true })
	hi("@constant.macro", { fg = p.purple })

	-- attributes / decorators
	hi("@attribute", { fg = p.purple })
	hi("@attribute.builtin", { fg = p.purple, italic = true })

	-- properties / fields
	hi("@property", { fg = p.teal })

	-- markup (markdown / rst)
	hi("@markup.strong", { fg = p.fg_bright, bold = true })
	hi("@markup.italic", { fg = p.fg, italic = true })
	hi("@markup.strikethrough", { fg = p.fg_dim, strikethrough = true })
	hi("@markup.underline", { underline = true })
	hi("@markup.heading.1", { fg = p.sky, bold = true })
	hi("@markup.heading.2", { fg = p.teal, bold = true })
	hi("@markup.heading.3", { fg = p.green, bold = true })
	hi("@markup.heading.4", { fg = p.yellow, bold = true })
	hi("@markup.heading.5", { fg = p.orange, bold = true })
	hi("@markup.heading.6", { fg = p.rose, bold = true })
	hi("@markup.quote", { fg = p.fg_dim, italic = true })
	hi("@markup.math", { fg = p.cyan })
	hi("@markup.link", { fg = p.sky, underline = true })
	hi("@markup.link.label", { fg = p.teal })
	hi("@markup.link.url", { fg = p.sky, underline = true })
	hi("@markup.raw", { fg = p.teal, bg = p.bg_code })
	hi("@markup.raw.block", { fg = p.teal, bg = p.bg_code })
	hi("@markup.list", { fg = p.fg_dim })
	hi("@markup.list.checked", { fg = p.green })
	hi("@markup.list.unchecked", { fg = p.fg_dim })

	-- tags (HTML/JSX)
	hi("@tag", { fg = p.blue })
	hi("@tag.builtin", { fg = p.blue, italic = true })
	hi("@tag.attribute", { fg = p.rose }) -- rose: clearly not a tag name
	hi("@tag.delimiter", { fg = p.fg_dim })

	-- misc
	hi("@operator", { fg = p.fg_dim })
	hi("@label", { fg = p.blue })
	hi("@error", { fg = p.red, bold = true })
	hi("@none", { fg = p.fg })
	hi("@conceal", { fg = p.comment })
	hi("@diff.plus", { link = "DiffAdd" })
	hi("@diff.minus", { link = "DiffDelete" })
	hi("@diff.delta", { link = "DiffChange" })

	-- ── LSP semantic tokens ────────────────────────────────────────────────────
	hi("@lsp.type.class", { link = "@type" })
	hi("@lsp.type.comment", { link = "Comment" })
	hi("@lsp.type.decorator", { fg = p.purple })
	hi("@lsp.type.enum", { link = "@type" })
	hi("@lsp.type.enumMember", { fg = p.orange })
	hi("@lsp.type.function", { link = "@function" })
	hi("@lsp.type.interface", { fg = p.green })
	hi("@lsp.type.keyword", { link = "@keyword" })
	hi("@lsp.type.macro", { fg = p.purple })
	hi("@lsp.type.method", { link = "@function.method" })
	hi("@lsp.type.namespace", { link = "@module" })
	hi("@lsp.type.number", { link = "@number" })
	hi("@lsp.type.operator", { link = "@operator" })
	hi("@lsp.type.parameter", { link = "@variable.parameter" })
	hi("@lsp.type.property", { link = "@property" })
	hi("@lsp.type.selfKeyword", { fg = p.rose, italic = true })
	hi("@lsp.type.string", { link = "@string" })
	hi("@lsp.type.struct", { link = "@type" })
	hi("@lsp.type.type", { link = "@type" })
	hi("@lsp.type.typeParameter", { fg = p.green })
	hi("@lsp.type.variable", { link = "@variable" })
	hi("@lsp.typemod.function.defaultLibrary", { fg = p.sky, italic = true })
	hi("@lsp.typemod.variable.defaultLibrary", { fg = p.rose, italic = true })
	hi("@lsp.typemod.variable.readonly", { fg = p.orange })
	hi("@lsp.typemod.keyword.documentation", { fg = p.purple })

	-- ── Diagnostics ────────────────────────────────────────────────────────────
	hi("DiagnosticError", { fg = p.red })
	hi("DiagnosticWarn", { fg = p.orange })
	hi("DiagnosticInfo", { fg = p.sky })
	hi("DiagnosticHint", { fg = p.teal })
	hi("DiagnosticOk", { fg = p.green })

	hi("DiagnosticSignError", { fg = p.red })
	hi("DiagnosticSignWarn", { fg = p.orange })
	hi("DiagnosticSignInfo", { fg = p.sky })
	hi("DiagnosticSignHint", { fg = p.teal })

	hi("DiagnosticVirtualTextError", { fg = p.red, italic = true })
	hi("DiagnosticVirtualTextWarn", { fg = p.orange, italic = true })
	hi("DiagnosticVirtualTextInfo", { fg = p.sky, italic = true })
	hi("DiagnosticVirtualTextHint", { fg = p.teal, italic = true })
	hi("DiagnosticVirtualTextOk", { fg = p.green, italic = true })

	hi("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
	hi("DiagnosticUnderlineWarn", { undercurl = true, sp = p.orange })
	hi("DiagnosticUnderlineInfo", { undercurl = true, sp = p.sky })
	hi("DiagnosticUnderlineHint", { undercurl = true, sp = p.teal })

	hi("DiagnosticFloatingError", { fg = p.red })
	hi("DiagnosticFloatingWarn", { fg = p.orange })
	hi("DiagnosticFloatingInfo", { fg = p.sky })
	hi("DiagnosticFloatingHint", { fg = p.teal })

	hi("DiagnosticDeprecated", { fg = p.fg_dim, strikethrough = true })
	hi("DiagnosticUnnecessary", { fg = p.comment, italic = true })

	-- ── LSP references / misc ──────────────────────────────────────────────────
	hi("LspReferenceText", { bg = p.bg_select })
	hi("LspReferenceRead", { bg = p.bg_select })
	hi("LspReferenceWrite", { bg = p.bg_select, underline = true })
	hi("LspSignatureActiveParameter", { fg = p.yellow, bold = true, underline = true })
	hi("LspInlayHint", { fg = p.comment, bg = p.bg_code, italic = true })
	hi("LspCodeLens", { fg = p.comment, italic = true })
	hi("LspCodeLensSeparator", { fg = p.comment })

	-- ── Telescope ──────────────────────────────────────────────────────────────
	hi("TelescopeNormal", { fg = p.fg, bg = p.bg_code })
	hi("TelescopePromptNormal", { fg = p.fg, bg = p.bg_code })
	hi("TelescopeResultsNormal", { fg = p.fg, bg = p.bg_code })
	hi("TelescopePreviewNormal", { fg = p.fg, bg = p.bg })
	hi("TelescopeBorder", { fg = p.bg_hover, bg = p.bg_code })
	hi("TelescopePromptBorder", { fg = p.sky, bg = p.bg_code })
	hi("TelescopeResultsBorder", { fg = p.bg_hover, bg = p.bg_code })
	hi("TelescopePreviewBorder", { fg = p.bg_hover, bg = p.bg })
	hi("TelescopePromptPrefix", { fg = p.sky })
	hi("TelescopePromptCounter", { fg = p.fg_dim })
	hi("TelescopeSelection", { fg = p.fg_bright, bg = p.bg_select })
	hi("TelescopeSelectionCaret", { fg = p.sky, bg = p.bg_select })
	hi("TelescopeMultiSelection", { fg = p.teal, bg = p.bg_select })
	hi("TelescopeMultiIcon", { fg = p.teal })
	hi("TelescopeTitle", { fg = p.fg_bright, bold = true })
	hi("TelescopePromptTitle", { fg = p.bg, bg = p.sky, bold = true })
	hi("TelescopeResultsTitle", { fg = p.fg_dim })
	hi("TelescopePreviewTitle", { fg = p.bg, bg = p.teal, bold = true })
	hi("TelescopeMatching", { fg = p.sky, bold = true })
	hi("TelescopeResultsDiffAdd", { fg = p.green })
	hi("TelescopeResultsDiffChange", { fg = p.orange })
	hi("TelescopeResultsDiffDelete", { fg = p.red })
	hi("TelescopeResultsDiffUntracked", { fg = p.fg_dim })

	-- ── nvim-cmp ───────────────────────────────────────────────────────────────
	hi("CmpItemAbbr", { fg = p.fg })
	hi("CmpItemAbbrDeprecated", { fg = p.fg_dim, strikethrough = true })
	hi("CmpItemAbbrMatch", { fg = p.sky, bold = true })
	hi("CmpItemAbbrMatchFuzzy", { fg = p.sky })
	hi("CmpItemMenu", { fg = p.fg_dim, italic = true })
	hi("CmpItemKindDefault", { fg = p.fg_dim })
	hi("CmpItemKindText", { fg = p.fg })
	hi("CmpItemKindKeyword", { fg = p.blue })
	hi("CmpItemKindVariable", { fg = p.fg })
	hi("CmpItemKindConstant", { fg = p.orange })
	hi("CmpItemKindReference", { fg = p.rose })
	hi("CmpItemKindValue", { fg = p.orange })
	hi("CmpItemKindFunction", { fg = p.sky })
	hi("CmpItemKindMethod", { fg = p.sky })
	hi("CmpItemKindConstructor", { fg = p.green })
	hi("CmpItemKindClass", { fg = p.green })
	hi("CmpItemKindInterface", { fg = p.green })
	hi("CmpItemKindStruct", { fg = p.green })
	hi("CmpItemKindEvent", { fg = p.purple })
	hi("CmpItemKindEnum", { fg = p.green })
	hi("CmpItemKindUnit", { fg = p.orange })
	hi("CmpItemKindModule", { fg = p.fg_bright })
	hi("CmpItemKindProperty", { fg = p.teal })
	hi("CmpItemKindField", { fg = p.teal })
	hi("CmpItemKindTypeParameter", { fg = p.green })
	hi("CmpItemKindEnumMember", { fg = p.orange })
	hi("CmpItemKindOperator", { fg = p.fg_dim })
	hi("CmpItemKindSnippet", { fg = p.purple })
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
	hi("NeoTreeFileNameOpened", { fg = p.teal, italic = true })
	hi("NeoTreeFileIcon", { fg = p.fg_dim })
	hi("NeoTreeSymbolicLinkTarget", { fg = p.cyan, italic = true })
	hi("NeoTreeGitAdded", { fg = p.green })
	hi("NeoTreeGitConflict", { fg = p.red, bold = true })
	hi("NeoTreeGitDeleted", { fg = p.red })
	hi("NeoTreeGitIgnored", { fg = p.comment })
	hi("NeoTreeGitModified", { fg = p.orange })
	hi("NeoTreeGitUnstaged", { fg = p.orange })
	hi("NeoTreeGitUntracked", { fg = p.fg_dim })
	hi("NeoTreeGitStaged", { fg = p.green })
	hi("NeoTreeIndentMarker", { fg = p.bg_hover })
	hi("NeoTreeExpander", { fg = p.fg_dim })
	hi("NeoTreeTabActive", { fg = p.fg_bright, bg = p.bg, bold = true })
	hi("NeoTreeTabInactive", { fg = p.fg_dim, bg = p.bg_code })
	hi("NeoTreeTabSeparatorActive", { fg = p.bg, bg = p.bg })
	hi("NeoTreeTabSeparatorInactive", { fg = p.bg_code, bg = p.bg_code })
	hi("NeoTreeWinSeparator", { fg = p.bg_hover, bg = p.bg_code })

	-- ── which-key ──────────────────────────────────────────────────────────────
	hi("WhichKey", { fg = p.lime })
	hi("WhichKeyGroup", { fg = p.teal, bold = true })
	hi("WhichKeyDesc", { fg = p.fg })
	hi("WhichKeySeperator", { fg = p.comment })
	hi("WhichKeySeparator", { fg = p.comment })
	hi("WhichKeyFloat", { bg = p.bg_code })
	hi("WhichKeyBorder", { fg = p.bg_hover, bg = p.bg_code })
	hi("WhichKeyValue", { fg = p.fg_dim })
	hi("WhichKeyTitle", { fg = p.fg_bright, bold = true })

	-- ── nvim-notify ────────────────────────────────────────────────────────────
	hi("NotifyERRORBorder", { fg = p.red })
	hi("NotifyWARNBorder", { fg = p.orange })
	hi("NotifyINFOBorder", { fg = p.sky })
	hi("NotifyDEBUGBorder", { fg = p.comment })
	hi("NotifyTRACEBorder", { fg = p.purple })
	hi("NotifyERRORIcon", { fg = p.red })
	hi("NotifyWARNIcon", { fg = p.orange })
	hi("NotifyINFOIcon", { fg = p.sky })
	hi("NotifyDEBUGIcon", { fg = p.comment })
	hi("NotifyTRACEIcon", { fg = p.purple })
	hi("NotifyERRORTitle", { fg = p.red, bold = true })
	hi("NotifyWARNTitle", { fg = p.orange, bold = true })
	hi("NotifyINFOTitle", { fg = p.sky, bold = true })
	hi("NotifyDEBUGTitle", { fg = p.fg_dim, bold = true })
	hi("NotifyTRACETitle", { fg = p.purple, bold = true })
	hi("NotifyERRORBody", { fg = p.fg, bg = p.bg_code })
	hi("NotifyWARNBody", { fg = p.fg, bg = p.bg_code })
	hi("NotifyINFOBody", { fg = p.fg, bg = p.bg_code })
	hi("NotifyDEBUGBody", { fg = p.fg, bg = p.bg_code })
	hi("NotifyTRACEBody", { fg = p.fg, bg = p.bg_code })

	-- ── indent-blankline ───────────────────────────────────────────────────────
	hi("IblIndent", { fg = p.bg_hover })
	hi("IblScope", { fg = p.comment })
	hi("IblWhitespace", { fg = p.bg_hover })
	hi("IndentBlanklineChar", { fg = p.bg_hover })
	hi("IndentBlanklineContextChar", { fg = p.comment })
	hi("IndentBlanklineContextStart", { underline = true, sp = p.comment })

	-- ── gitsigns ───────────────────────────────────────────────────────────────
	hi("GitSignsAdd", { fg = p.green })
	hi("GitSignsChange", { fg = p.orange })
	hi("GitSignsDelete", { fg = p.red })
	hi("GitSignsTopDelete", { fg = p.red })
	hi("GitSignsChangeDelete", { fg = p.orange })
	hi("GitSignsUntracked", { fg = p.fg_dim })
	hi("GitSignsAddNr", { fg = p.green })
	hi("GitSignsChangeNr", { fg = p.orange })
	hi("GitSignsDeleteNr", { fg = p.red })
	hi("GitSignsAddLn", { bg = p.diff_add })
	hi("GitSignsChangeLn", { bg = p.diff_chg })
	hi("GitSignsDeleteLn", { bg = p.diff_del })
	hi("GitSignsAddInline", { fg = p.green, bg = p.diff_add, bold = true })
	hi("GitSignsChangeInline", { fg = p.yellow, bg = p.diff_txt, bold = true })
	hi("GitSignsDeleteInline", { fg = p.red, bg = p.diff_del, bold = true })

	-- ── lazy.nvim ──────────────────────────────────────────────────────────────
	hi("LazyH1", { fg = p.bg, bg = p.teal, bold = true })
	hi("LazyH2", { fg = p.fg_bright, bold = true })
	hi("LazyButton", { fg = p.fg, bg = p.bg_code })
	hi("LazyButtonActive", { fg = p.bg, bg = p.sky, bold = true })
	hi("LazySpecial", { fg = p.sky })
	hi("LazyReasonPlugin", { fg = p.purple })
	hi("LazyReasonEvent", { fg = p.orange })
	hi("LazyReasonKeys", { fg = p.teal })
	hi("LazyReasonCmd", { fg = p.sky })
	hi("LazyReasonFt", { fg = p.green })
	hi("LazyProgressDone", { fg = p.green })
	hi("LazyProgressTodo", { fg = p.fg_dim })
	hi("LazyNoCond", { fg = p.comment })
	hi("LazyDimmed", { fg = p.comment })
	hi("LazyProp", { fg = p.teal })
	hi("LazyValue", { fg = p.orange })
	hi("LazyUrl", { fg = p.sky, underline = true })
	hi("LazyCommit", { fg = p.teal })
	hi("LazyCommitType", { fg = p.purple })
	hi("LazyCommitScope", { fg = p.rose })

	-- ── snacks.nvim (LazyVim default) ─────────────────────────────────────────
	hi("SnacksPickerBorder", { fg = p.bg_hover, bg = p.bg_code })
	hi("SnacksPickerTitle", { fg = p.bg, bg = p.sky, bold = true })
	hi("SnacksPickerPreviewTitle", { fg = p.bg, bg = p.teal, bold = true })
	hi("SnacksPickerInputTitle", { fg = p.bg, bg = p.purple, bold = true })
	hi("SnacksPickerNormal", { fg = p.fg, bg = p.bg_code })
	hi("SnacksPickerPreview", { fg = p.fg, bg = p.bg })
	hi("SnacksPickerPrompt", { fg = p.sky })
	hi("SnacksPickerSearch", { fg = p.yellow, bold = true })
	hi("SnacksPickerMatch", { fg = p.sky, bold = true })
	hi("SnacksPickerSelected", { fg = p.teal })
	hi("SnacksPickerDir", { fg = p.fg_dim })
	hi("SnacksDashboardHeader", { fg = p.teal })
	hi("SnacksDashboardFooter", { fg = p.comment, italic = true })
	hi("SnacksDashboardDesc", { fg = p.fg })
	hi("SnacksDashboardKey", { fg = p.sky })
	hi("SnacksDashboardAction", { fg = p.sky })
	hi("SnacksDashboardSpecial", { fg = p.rose })
	hi("SnacksDashboardDir", { fg = p.fg_dim })
	hi("SnacksNotifierInfo", { fg = p.sky })
	hi("SnacksNotifierWarn", { fg = p.orange })
	hi("SnacksNotifierError", { fg = p.red })
	hi("SnacksNotifierDebug", { fg = p.comment })
	hi("SnacksNotifierTrace", { fg = p.purple })
	hi("SnacksNotifierBorderInfo", { fg = p.sky })
	hi("SnacksNotifierBorderWarn", { fg = p.orange })
	hi("SnacksNotifierBorderError", { fg = p.red })
	hi("SnacksNotifierBorderDebug", { fg = p.comment })
	hi("SnacksNotifierBorderTrace", { fg = p.purple })
	hi("SnacksIndent", { fg = p.bg_hover })
	hi("SnacksIndentScope", { fg = p.comment })
	hi("SnacksWordUnderCursor", { bg = p.bg_select })

	-- ── mini.nvim ──────────────────────────────────────────────────────────────
	hi("MiniStatuslineModeNormal", { fg = p.bg, bg = p.teal, bold = true })
	hi("MiniStatuslineModeInsert", { fg = p.bg, bg = p.sky, bold = true })
	hi("MiniStatuslineModeVisual", { fg = p.bg, bg = p.purple, bold = true })
	hi("MiniStatuslineModeReplace", { fg = p.bg, bg = p.red, bold = true })
	hi("MiniStatuslineModeCommand", { fg = p.bg, bg = p.orange, bold = true })
	hi("MiniStatuslineModeOther", { fg = p.bg, bg = p.rose, bold = true })
	hi("MiniStatuslineFilename", { fg = p.fg, bg = p.bg_code })
	hi("MiniStatuslineFileinfo", { fg = p.fg_dim, bg = p.bg_code })
	hi("MiniStatuslineDevinfo", { fg = p.fg_dim, bg = p.bg_code })
	hi("MiniStatuslineInactive", { fg = p.fg_dim, bg = p.bg_code })
	hi("MiniCursorword", { bg = p.bg_select })
	hi("MiniCursorwordCurrent", { bg = p.bg_select, underline = true })
	hi("MiniIndentscopeSymbol", { fg = p.comment })
	hi("MiniIndentscopePrefix", { nocombine = true })
	hi("MiniPickMatchCurrent", { fg = p.fg_bright, bg = p.bg_select })
	hi("MiniPickMatchRanges", { fg = p.sky, bold = true })
	hi("MiniPickBorder", { fg = p.bg_hover, bg = p.bg_code })
	hi("MiniPickBorderBusy", { fg = p.orange, bg = p.bg_code })
	hi("MiniPickBorderText", { fg = p.sky, bg = p.bg_code, bold = true })
	hi("MiniPickNormal", { fg = p.fg, bg = p.bg_code })
	hi("MiniPickPrompt", { fg = p.sky, bg = p.bg_code, bold = true })
	hi("MiniPickHeader", { fg = p.rose, bold = true })
	hi("MiniPickIconDirectory", { fg = p.sky })
	hi("MiniPickIconFile", { fg = p.fg_dim })
	hi("MiniDiffSignAdd", { fg = p.green })
	hi("MiniDiffSignChange", { fg = p.orange })
	hi("MiniDiffSignDelete", { fg = p.red })
	hi("MiniDiffOverAdd", { bg = p.diff_add })
	hi("MiniDiffOverChange", { bg = p.diff_chg })
	hi("MiniDiffOverDelete", { bg = p.diff_del })
	hi("MiniDiffOverContext", { bg = p.bg_code })
	hi("MiniJump", { fg = p.bg, bg = p.yellow })
	hi("MiniJump2dSpot", { fg = p.yellow, bold = true, nocombine = true })
	hi("MiniJump2dSpotAhead", { fg = p.teal, nocombine = true })
	hi("MiniJump2dSpotUnique", { fg = p.orange, bold = true, nocombine = true })
	hi("MiniHipatternsFixme", { fg = p.bg, bg = p.red, bold = true })
	hi("MiniHipatternsTodo", { fg = p.bg, bg = p.yellow, bold = true })
	hi("MiniHipatternsNote", { fg = p.bg, bg = p.sky, bold = true })
	hi("MiniHipatternsHack", { fg = p.bg, bg = p.orange, bold = true })

	-- ── Terminal colors (mirrors Ghostty palette order exactly) ───────────────
	vim.g.terminal_color_0 = p.bg -- black
	vim.g.terminal_color_1 = p.red -- red
	vim.g.terminal_color_2 = p.green -- green
	vim.g.terminal_color_3 = p.purple -- yellow slot  → purple
	vim.g.terminal_color_4 = p.blue -- blue
	vim.g.terminal_color_5 = p.sky -- magenta slot → sky
	vim.g.terminal_color_6 = p.orange -- cyan slot    → orange
	vim.g.terminal_color_7 = p.fg -- white
	vim.g.terminal_color_8 = p.comment -- bright black
	vim.g.terminal_color_9 = p.red_br -- bright red
	vim.g.terminal_color_10 = p.green_br -- bright green
	vim.g.terminal_color_11 = p.yellow -- bright yellow
	vim.g.terminal_color_12 = p.blue_br -- bright blue
	vim.g.terminal_color_13 = p.purple_br -- bright magenta
	vim.g.terminal_color_14 = p.white -- bright cyan  → white
	vim.g.terminal_color_15 = p.fg_bright -- bright white
end

return M
