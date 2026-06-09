local M = {}

function M.get(p, cfg)
	return {
		LazyH1 = { fg = p.bg, bg = p.mint, bold = true },
		LazyH2 = { fg = p.fg_bright, bold = true },
		LazyButton = { fg = p.fg, bg = p.bg_code },
		LazyButtonActive = { fg = p.bg, bg = p.sky, bold = true },
		LazySpecial = { fg = p.sky },
		LazyReasonPlugin = { fg = p.sky },
		LazyReasonEvent = { fg = p.amber },
		LazyReasonKeys = { fg = p.mint },
		LazyReasonCmd = { fg = p.sky },
		LazyReasonFt = { fg = p.amber },
		LazyProgressDone = { fg = p.mint },
		LazyProgressTodo = { fg = p.fg_dim },
		LazyNoCond = { fg = p.comment },
		LazyDimmed = { fg = p.comment },
		LazyProp = { fg = p.mint },
		LazyValue = { fg = p.amber },
		LazyUrl = { fg = p.sky, underline = true },
		LazyCommit = { fg = p.mint },
		LazyCommitType = { fg = p.sky },
		LazyCommitScope = { fg = p.rose },
	}
end

return M
