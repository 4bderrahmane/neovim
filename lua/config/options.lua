-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.number = false
-- vim.opt.relativenumber = false

-- Make Neovim see NVM's Node (important if you launch nvim from a GUI)
local nvm_bin = vim.fn.expand("~/.nvm/versions/node/v24.11.0/bin")
if vim.fn.isdirectory(nvm_bin) == 1 then
  vim.env.PATH = nvm_bin .. ":" .. vim.env.PATH
end
