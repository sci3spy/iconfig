-- Set the leader key
vim.g.mapleader = " "

-- General mappings

-- if not git_files; fallback to find_files
vim.keymap.set("n", "<leader>ff", function()
  local ok = pcall(require("telescope.builtin").git_files)
  if not ok then
    require("telescope.builtin").find_files()
  end
end)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)

-- Snippet Jumping
local luasnip = require "luasnip"

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<C-l>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)

-- Disable arrow keys
vim.keymap.set({ "n", "i", "v" }, "<Up>", "")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "")
