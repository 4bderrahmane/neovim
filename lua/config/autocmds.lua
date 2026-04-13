-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Custom indentation for C++
vim.api.nvim_create_autocmd("FileType", {

  pattern = { "cpp", "c", "h", "hpp" },
  callback = function()
    vim.opt_local.tabstop = 4 -- how many spaces a <Tab> counts for
    vim.opt_local.shiftwidth = 4 -- spaces used for each indent step
    vim.opt_local.expandtab = true -- convert tabs to spaces
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.cmd([[
      inoreabbrev <buffer> cp #include <bits/stdc++.h><CR>using namespace std;<CR>using ll = long long;<CR>using ull = unsigned long long;<CR>#define fast_io ios::sync_with_stdio(false); cin.tie(nullptr);<CR>#define all(x) x.begin(), x.end()<CR>#define rall(x) x.rbegin(), x.rend()<CR>#define vi vector<int><CR>#define vii vector<long long><CR>#define pii pair<int, int><CR>#define vvi vector<vector<int>><CR>#define vvii vector<vector<ll>><CR>#define pll pair<ll, ll><CR>#define str string<CR>#define sz size_t<CR>#define fi first<CR>#define se second<CR>#define endl '\n'<CR>#define debug(x) cout << #x << " is " << x << endl<CR>#define pub push_back<CR>#define pob pop_back<CR>#define puf push_front<CR>#define pof pop_front<CR>#define lb lower_bound<CR>#define ub upper_bound<CR><CR>int main()<CR>{<CR>    fast_io;<CR><CR>    int t;<CR>    cin >> t;<CR>    while (t--)<CR>    {<CR>        <CR>    }<CR><CR>    return 0;<CR>}
    ]])
  end,
})

-- Colored notes for .txt (FileType = text)
local notes_group = vim.api.nvim_create_augroup("user_text_notes_highlight", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = notes_group,
  pattern = "text",
  callback = function()
    vim.cmd("syntax on")

    -- optional: clear old definitions (useful when reloading)
    vim.cmd([[
      silent! syntax clear NotesH1 NotesH2 NotesH3 NotesBullet NotesNumbered NotesTodo NotesWarn
    ]])

    -- More permissive matches
    vim.cmd([[
      syntax match NotesH1 /^\s*#\s\+.*$/
      syntax match NotesH2 /^\s*##\s\+.*$/
      syntax match NotesH3 /^\s*###\s\+.*$/

      syntax match NotesBullet /^\s*[-*+]\s\+.*$/
      syntax match NotesNumbered /^\s*\d\+\.\s\+.*$/

      syntax match NotesTodo /\v<(TODO|FIXME|NOTE)>\s*:?.*$/
      syntax match NotesWarn /\v<(IMPORTANT|WARNING|DANGER)>\s*:?.*$/

      highlight link NotesH1 Title
      highlight link NotesH2 Function
      highlight link NotesH3 Identifier

      highlight link NotesBullet Special
      highlight link NotesNumbered Special

      highlight link NotesTodo Todo
      highlight link NotesWarn WarningMsg
    ]])
  end,
})
