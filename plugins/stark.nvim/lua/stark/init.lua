local M = {}

-- Exposed for lualine theme + external `require("stark").palette` access.
M.palette = require("stark.palette")

function M.setup(opts)
	require("stark.config").extend(opts)
end

function M.load()
	require("stark.theme").load()
end

return M
