# stark.nvim

Minimal dark Neovim colorscheme. Black background, off-white foreground, mint + amber + sky accents.

| Role        | Color     |
|-------------|-----------|
| Background  | `#0d0d0d` |
| Foreground  | `#d4d4d4` |
| Mint        | `#00CF9C` |
| Amber       | `#f59e0b` |
| Sky         | `#38bdf8` |
| Red         | `#f5425d` |

## Installation (LazyVim)

### Option A — local plugin

1. Clone or copy this folder to `~/.config/nvim/plugins/stark.nvim`
2. Add `~/.config/nvim/lua/plugins/stark.lua`:

```lua
return {
  {
    dir = "~/.config/nvim/plugins/stark.nvim",
    name = "stark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("stark")
    end,
  },
}
```

### Option B — override LazyVim colorscheme

In `~/.config/nvim/lua/config/options.lua`:

```lua
vim.cmd.colorscheme("stark")
```

## Lualine

```lua
require("lualine").setup({
  options = { theme = "stark" },
})
```

## Structure

```
stark.nvim/
├── colors/
│   └── stark.lua              ← Neovim entry point (:colorscheme stark)
└── lua/
    ├── stark/
    │   └── init.lua            ← Palette + all highlight group definitions
    └── lualine/
        └── themes/
            └── stark.lua       ← Lualine theme
```
