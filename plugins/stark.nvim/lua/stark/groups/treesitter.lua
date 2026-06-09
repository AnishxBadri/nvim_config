local M = {}

function M.get(p, cfg)
	local italic_c = cfg.italic_comments or nil
	local italic_imp = cfg.italic_imports or nil
	local kw_bold = cfg.bold_keywords or nil

	return {
		-- ── Comments ──
		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { fg = p.fg_dim, italic = italic_c },
		["@comment.todo"] = { fg = p.amber_br, bold = true },
		["@comment.warning"] = { fg = p.amber, bold = true },
		["@comment.error"] = { fg = p.red, bold = true },
		["@comment.note"] = { fg = p.sky, bold = true },

		-- ── Punctuation ──
		["@punctuation.delimiter"] = { fg = p.fg_dim },
		["@punctuation.bracket"] = { fg = p.fg_dim },
		["@punctuation.special"] = { fg = p.teal },

		-- ── Strings ──
		["@string"] = { link = "String" },
		["@string.documentation"] = { fg = p.mint, italic = true },
		["@string.regex"] = { fg = p.teal },
		["@string.escape"] = { fg = p.teal, bold = true },
		["@string.special"] = { fg = p.teal },
		["@string.special.url"] = { fg = p.sky, underline = true },
		["@string.special.symbol"] = { fg = p.rose },
		["@character"] = { link = "Character" },
		["@character.special"] = { fg = p.teal },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Float" },
		["@boolean"] = { link = "Boolean" },

		-- ── Functions ──
		["@function"] = { fg = p.amber_br },
		["@function.builtin"] = { fg = p.amber_br, italic = true },
		["@function.call"] = { fg = p.amber_br },
		["@function.macro"] = { fg = p.sky },
		["@function.method"] = { fg = p.amber_br },
		["@function.method.call"] = { fg = p.amber_br },
		["@constructor"] = { fg = p.amber_br },

		-- ── Variables ──
		["@variable"] = { fg = p.fg },
		["@variable.builtin"] = { fg = p.rose, italic = true },
		["@variable.parameter"] = { fg = p.rose },
		["@variable.parameter.builtin"] = { fg = p.rose, italic = true },
		["@variable.member"] = { fg = p.mint },

		-- ── Keywords ──
		["@keyword"] = { fg = p.fg_bright, bold = kw_bold },
		["@keyword.function"] = { fg = p.fg_bright, bold = kw_bold },
		["@keyword.operator"] = { fg = p.fg_bright, bold = kw_bold },
		["@keyword.return"] = { fg = p.fg_bright, bold = kw_bold },
		["@keyword.import"] = { fg = italic_imp and p.fg_bright or p.fg, italic = italic_imp },
		["@keyword.modifier"] = { fg = p.fg_bright, bold = kw_bold },
		["@keyword.repeat"] = { fg = p.fg_bright, bold = kw_bold },
		["@keyword.conditional"] = { fg = p.fg_bright, bold = kw_bold },
		["@keyword.conditional.ternary"] = { fg = p.fg_bright, bold = kw_bold },
		["@keyword.exception"] = { fg = p.red, bold = true },
		["@keyword.directive"] = { fg = p.red },
		["@keyword.coroutine"] = { fg = p.red },

		-- ── Types ──
		["@type"] = { fg = p.amber },
		["@type.builtin"] = { fg = p.amber, italic = true },
		["@type.definition"] = { fg = p.amber, bold = true },
		["@type.qualifier"] = { fg = p.fg_bright, bold = kw_bold },

		-- ── Modules / namespaces ──
		["@module"] = { fg = p.fg_bright },
		["@module.builtin"] = { fg = p.fg_bright, italic = true },
		["@namespace"] = { fg = p.fg_bright },

		-- ── Constants ──
		["@constant"] = { fg = p.amber },
		["@constant.builtin"] = { fg = p.amber, italic = true },
		["@constant.macro"] = { fg = p.sky },

		-- ── Attributes / decorators ──
		["@attribute"] = { fg = p.sky },
		["@attribute.builtin"] = { fg = p.sky, italic = true },

		-- ── Properties ──
		["@property"] = { fg = p.mint },
		-- Data-format files: keys ARE structure, distinguish from values
		["@property.json"] = { fg = p.sky },
		["@property.jsonc"] = { fg = p.sky },
		["@property.yaml"] = { fg = p.sky },
		["@property.toml"] = { fg = p.sky },
		["@property.ini"] = { fg = p.sky },
		["@property.hcl"] = { fg = p.sky },
		["@property.terraform"] = { fg = p.sky },
		["@property.gitconfig"] = { fg = p.sky },
		["@property.sshconfig"] = { fg = p.sky },
		["@property.systemd"] = { fg = p.sky },
		["@property.kdl"] = { fg = p.sky },
		["@property.hyprlang"] = { fg = p.sky },

		-- ── Tags (HTML/JSX) ──
		["@tag"] = { fg = p.sky },
		["@tag.builtin"] = { fg = p.sky, italic = true },
		["@tag.attribute"] = { fg = p.rose },
		["@tag.delimiter"] = { fg = p.fg_dim },

		-- ── Misc ──
		["@operator"] = { fg = p.fg_dim },
		["@label"] = { fg = p.fg_bright, bold = kw_bold },
		["@error"] = { fg = p.red, bold = true },
		["@none"] = { fg = p.fg },
		["@conceal"] = { fg = p.comment },
		["@diff.plus"] = { link = "DiffAdd" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.delta"] = { link = "DiffChange" },
	}
end

return M
