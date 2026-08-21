# todo-tracker.nvim 🔭

[![Follow on X](https://img.shields.io/badge/Follow-@janecodelife-000000?style=for-the-badge&logo=x)](https://x.com/janecodelife)
[![Subscribe on YouTube](https://img.shields.io/badge/Subscribe-@JaneCodeLife-FF0000?style=for-the-badge&logo=youtube)](https://www.youtube.com/@JaneCodeLife)

A lightweight, production-ready, and highly performant Neovim plugin written in Lua to seamlessly assign and List workspace tags (`TODO`, `FIXME`, `NOTE`) across all programming languages in a blink.

Optimized for **Neovim 0.12+** and modern development environments (like Laravel, Next.js, etc.).

---

## 📦 Installation

Install the plugin using Neovim's native package manager layer (`vim.pack.add`). Add the following snippet to your main `init.lua` configuration file:

```lua
vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim", -- required just for search
    "https://github.com/janecodelife/todo-tracker.nvim",
})
```

---

## ⌨️ Configuration & Keymaps

Drop this cleanly separated setup into your global Neovim config file (`init.lua`). It activates the automated assignment interface alongside a highly responsive **Telescope** workspace search implementation:

```lua
vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim", -- required just for search
	"https://github.com/janecodelife/todo-tracker.nvim",
})

-- save load plugin after install
local status, todo_tracker = pcall(require, "todo-tracker")

if status then
	todo_tracker.setup({})

	local tracker_ui = require("todo-tracker.ui")
	vim.keymap.set("n", "<leader>ta", tracker_ui.add_comment, { desc = "Add Todo/Fixme/Note Tag" })

	local map = vim.keymap.set
	local builtin = require("telescope.builtin")

	local function search_todo(keyword)
		builtin.live_grep({
			default_text = "HERE:" .. keyword,
			prompt_title = "Find Comments -> HERE:" .. keyword,
		})
	end

	map("n", "<leader>tt", function()
		search_todo("TODO")
	end, { desc = "List and jump to HERE:TODO" })

	map("n", "<leader>tf", function()
		search_todo("FIXME")
	end, { desc = "List and jump to HERE:FIXME" })

	map("n", "<leader>tn", function()
		search_todo("NOTE")
	end, { desc = "List and jump to HERE:NOTE" })
else
end

```

## Demo Video 📺

<p align="center">
  <img src="assets/todo-tracker.gif" alt="todo-tracker-video" width="100%">
</p>

---

## 💝 Support the Project

> _This plugin is built entirely on developer insights gathered over **years of building real-world software** to catch common pain points, combined with **months of dedicated building and rigorous testing** to ensure it operates flawlessly._

If this utility boosts your everyday speed and eliminates annoying file search clutter, please consider buying me a coffee or supporting my continuous maintenance!

You can tip or donate directly to my **TRON (TRX / USDT-TRC20)** crypto wallet address:

### ☕☕☕☕ Support me by coffee via USDT ☕☕☕☕

- **Network:** `TRX Tron (TRC20)`
- **Address:** `TAFFjBP39Z86weL5dDU1A2251VrgPprDUj`

> _Every bit of support fuels the expansion of this ecosystem and helps me write cleaner tools for all of us. Thank you for standing behind independent developers!_ 🙏

---

## 🤝 Let's Build Together (Contact Me)

I will be there i am answer to all messages

- **X (Twitter)**: [https://x.com/janecodelife](https://x.com/janecodelife)
- **YouTube**: [https://www.youtube.com/@JaneCodeLife](https://www.youtube.com/@JaneCodeLife)

---

## 🔗 My Other Plugins

Check out my other open-source tools to supercharge your Neovim environment:

- **[livewire-secure-properties](https://github.com/janecodelife/livewire-secure-properties)** - Secure livewire app properties by default and void headache.
- **[todo-tracker.nvim](https://github.com/janecodelife/todo-tracker.nvim)** - Assign and list app todos in a blink
- **[folders-bookmark.nvim](https://github.com/janecodelife/folders-bookmark.nvim)** - Bookmark folders and accessing them by keymap in a blink

---

# ThankYou

## Upcoming 🚀 (Stay Tuned!)

### The Ultimate Neovim Config for Modern Web & Laravel Devs ⚡

I am currently cooking a comprehensive guide and boilerplate configuration on **How to turn Neovim into a (Powerful) IDE** explicitly optimized for:

- **Backend & Frameworks**: PHP (Intelephense) & Full Laravel & Livewire Integration (With Preformance)
- **Frontend & Tooling**: HTML, CSS, JavaScript, TypeScript, and Livewire SFCs
- **Speed**: Blazing fast autocompletion, lightning-speed code navigation, and fuzzy finding.
