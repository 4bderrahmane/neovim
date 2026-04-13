-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move line up
--
-- vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
-- -- Move line down
-- vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

-- Move selected lines up/down in Visual Mode with Alt+Arrow
-- vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
-- vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Visual Mode: Move selection up/down
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Normal Mode: Move current line up/down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })

-- Visual Mode: Move selection left/right (indent)
vim.keymap.set("v", "<A-Right>", ">gv", { desc = "Indent selection right" })
vim.keymap.set("v", "<A-Left>", "<gv", { desc = "Indent selection left" })

-- Normal Mode: Move line left/right (indent)
vim.keymap.set("n", "<A-Right>", ">>", { desc = "Indent line right" })
vim.keymap.set("n", "<A-Left>", "<<", { desc = "Indent line left" })
