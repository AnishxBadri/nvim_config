-- lua/lualine/themes/stark.lua
-- Drop-in lualine theme. Usage:
--   require('lualine').setup { options = { theme = 'stark' } }

local p = require("stark").palette

return {
	normal = {
		a = { fg = p.bg, bg = p.mint, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_code },
		c = { fg = p.fg_dim, bg = p.bg },
	},
	insert = {
		a = { fg = p.bg, bg = p.sky, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_code },
		c = { fg = p.fg_dim, bg = p.bg },
	},
	visual = {
		a = { fg = p.bg, bg = p.rose, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_code },
		c = { fg = p.fg_dim, bg = p.bg },
	},
	replace = {
		a = { fg = p.bg, bg = p.red, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_code },
		c = { fg = p.fg_dim, bg = p.bg },
	},
	command = {
		a = { fg = p.bg, bg = p.amber, gui = "bold" },
		b = { fg = p.fg, bg = p.bg_code },
		c = { fg = p.fg_dim, bg = p.bg },
	},
	inactive = {
		a = { fg = p.fg_dim, bg = p.bg_code },
		b = { fg = p.fg_dim, bg = p.bg_code },
		c = { fg = p.fg_dim, bg = p.bg },
	},
}
