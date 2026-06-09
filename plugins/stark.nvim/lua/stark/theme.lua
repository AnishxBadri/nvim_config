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
	"mini",
	"whichkey",
	"notify",
	"indent",
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
