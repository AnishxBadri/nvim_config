local M = {}

function M.get(p, cfg)
	return {
		-- ── LSP semantic tokens ──
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.comment"] = { link = "Comment" },
		["@lsp.type.decorator"] = { fg = p.sky },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { fg = p.amber },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.interface"] = { fg = p.amber },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.macro"] = { fg = p.sky },
		["@lsp.type.method"] = { link = "@function.method" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { fg = p.rose, italic = true },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.typeParameter"] = { fg = p.amber },
		["@lsp.type.variable"] = { link = "@variable" },
		["@lsp.typemod.function.defaultLibrary"] = { fg = p.amber_br, italic = true },
		["@lsp.typemod.variable.defaultLibrary"] = { fg = p.rose, italic = true },
		["@lsp.typemod.variable.readonly"] = { fg = p.fg },
		["@lsp.typemod.keyword.documentation"] = { fg = p.sky },

		-- ── Diagnostics ──
		DiagnosticError = { fg = p.red },
		DiagnosticWarn = { fg = p.amber },
		DiagnosticInfo = { fg = p.sky },
		DiagnosticHint = { fg = p.mint },
		DiagnosticOk = { fg = p.mint },

		DiagnosticSignError = { fg = p.red },
		DiagnosticSignWarn = { fg = p.amber },
		DiagnosticSignInfo = { fg = p.sky },
		DiagnosticSignHint = { fg = p.mint },

		DiagnosticVirtualTextError = { fg = p.red, italic = true },
		DiagnosticVirtualTextWarn = { fg = p.amber, italic = true },
		DiagnosticVirtualTextInfo = { fg = p.sky, italic = true },
		DiagnosticVirtualTextHint = { fg = p.mint, italic = true },
		DiagnosticVirtualTextOk = { fg = p.mint, italic = true },

		DiagnosticUnderlineError = { undercurl = true, sp = p.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = p.amber },
		DiagnosticUnderlineInfo = { undercurl = true, sp = p.sky },
		DiagnosticUnderlineHint = { undercurl = true, sp = p.mint },

		DiagnosticFloatingError = { fg = p.red },
		DiagnosticFloatingWarn = { fg = p.amber },
		DiagnosticFloatingInfo = { fg = p.sky },
		DiagnosticFloatingHint = { fg = p.mint },

		DiagnosticDeprecated = { fg = p.fg_dim, strikethrough = true },
		DiagnosticUnnecessary = { fg = p.comment, italic = true },

		-- ── LSP references ──
		LspReferenceText = { bg = p.bg_hover },
		LspReferenceRead = { bg = p.bg_hover },
		LspReferenceWrite = { bg = p.bg_hover, underline = true },
		LspSignatureActiveParameter = { fg = p.amber_br, bold = true, underline = true },
		LspInlayHint = { fg = p.comment, bg = p.bg_code, italic = true },
		LspCodeLens = { fg = p.comment, italic = true },
		LspCodeLensSeparator = { fg = p.comment },
	}
end

return M
