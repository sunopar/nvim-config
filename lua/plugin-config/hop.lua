local status, hop = pcall(require, "hop")
if not status then
	vim.notify("没有找到 hop")
	return
end

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})

vim.api.nvim_set_keymap("n", "f", "<cmd> lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap("o", "f", "<cmd> lua require'hop'.hint_words()<cr>", {})
