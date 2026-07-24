# todo-tracker.nvim 🔭

A lightweight, production-ready, and highly performant Neovim plugin written in Lua to seamlessly assign and highlight workspace tags (`TODO`, `FIXME`, `NOTE`) across all programming languages.

Optimized for **Neovim 0.12+** and modern development environments (like Laravel, Next.js, etc.).

---

## ✨ Features

- **Smart Context-Aware Comments:** Automatically detects the current file's syntax and injects the comment using the correct language syntax strings (`//`, `--`, `/* */`, `#`, etc.).
- **Forced Highlighting:** Uses a powerful injection layer (`containedin=ALL`) that forces your tags to cut through native language comment colors, keeping them sharp and bright.
- **Isolated Prefix:** Enforces a clean `HERE:` prefix pattern (e.g., `HERE:TODO:`) to eliminate code clutter and prevent false positives from generic codebase search queries.
- **Zero-Bloat Search Control:** Completely unbundled from fixed internal search methods. It exposes pure API endpoints so you can configure custom workspace search mechanisms inside your global config.

---

## 📦 Installation

Install the plugin using Neovim's native package manager layer (`vim.pack.add`). Add the following snippet to your main `init.lua` configuration file:

```lua
vim.pack.add({
    "https://github.com/janecodelife/todo-tracker.nvim",
})
require("todo-tracker").setup({})
```

---

## ⌨️ Configuration & Keymaps

Drop this cleanly separated setup into your global Neovim config file (`init.lua`). It activates the automated assignment interface alongside a highly responsive **Telescope** workspace search implementation:

```lua
local map = vim.keymap.set
local tracker_ui = require("todo-tracker.ui")

-- 1. Assign Tag: Open a fast prompt window to write and insert a tag at your cursor
map("n", "<leader>ta", tracker_ui.add_comment, { desc = "Add Todo/Fixme/Note Tag" })

-- 2. Custom Independent Search Integration via Telescope & Ripgrep
local builtin = require("telescope.builtin")

local function search_todo(keyword)
  builtin.live_grep({
    default_text = "HERE:" .. keyword,
    prompt_title = "Find Comments -> HERE:" .. keyword,
  })
end

-- Jump shortcuts to list specific tags dynamically across your current directory
map("n", "<leader>tt", function() search_todo("TODO") end, { desc = "List and jump to HERE:TODO" })
map("n", "<leader>tf", function() search_todo("FIXME") end, { desc = "List and jump to HERE:FIXME" })
map("n", "<leader>tn", function() search_todo("NOTE") end, { desc = "List and jump to HERE:NOTE" })
```
