-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "到行首" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "到行尾" })

local opts = { noremap = true, silent = true }

-- 切换标签
vim.keymap.set("n", "tl", "<cmd>bnext<cr>", { desc = "下一个标签" })
vim.keymap.set("n", "th", "<cmd>bprevious<cr>", { desc = "上一个标签" })

-- 关闭标签
vim.keymap.set("n", "<leader>tt", "<leader>bd", { desc = "关闭当前标签", remap = true })

vim.keymap.set("n", "<leader>tl", "<Cmd>BufferLineCloseRight<CR>", { desc = "关闭右侧标签" })

vim.keymap.set("n", "<leader>th", "<Cmd>BufferLineCloseLeft<CR>", { desc = "关闭左侧标签" })

vim.keymap.set("n", "<leader>to", "<leader>bo", { desc = "关闭其他标签", remap = true })

-- 选择指定标签
vim.keymap.set("n", "<leader>tp", ":BufferLinePick<CR>", { desc = "切换指定标签" })

-- 快速删除函数 (d + f)
vim.keymap.set("n", "df", "V$%d", { desc = "删除函数" })

-- 快速复制函数 (y + f)
vim.keymap.set("n", "yf", "V$%y", { desc = "复制函数" })

-- 快速剪切函数 (c + f)
vim.keymap.set("n", "cf", "V$%c", { desc = "剪切函数" })

-- 快速注释函数
vim.keymap.set("n", "vf", "v$%", { desc = "注释函数" })

-- 全选
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "全选" })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { desc = "全选" })
vim.keymap.set("v", "<C-a>", "<Esc>ggVG", { desc = "全选" })

-- 数字加一
vim.keymap.set("n", "<leader>a", "<C-a>", { desc = "数字加一" })

-- 撤销功能 (Ctrl + z)
vim.keymap.set("n", "<C-z>", "u", { desc = "撤销" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "撤销" })
vim.keymap.set("v", "<C-z>", "<Esc>u", { desc = "撤销" })

-- 重做功能 (U)
vim.keymap.set("n", "U", "<C-r>", { desc = "重做" })

-- 粘贴时不覆盖原来复制的内容
vim.keymap.set("v", "p", '"_dP', { desc = "粘贴不覆盖复制内容" })

-- 粘贴功能 (Ctrl + v) - 系统剪贴板
vim.keymap.set("n", "<C-v>", '"+p', { desc = "粘贴（系统剪贴板）" })
vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "粘贴（系统剪贴板）" })
vim.keymap.set("v", "<C-v>", '"_d"+P', { desc = "粘贴（系统剪贴板，不覆盖）" })

-- 复制功能 (Ctrl + c)
vim.keymap.set("v", "<C-c>", '"+y', { desc = "复制到系统剪贴板" })
vim.keymap.set("n", "<C-c>", '"+yy', { desc = "复制当前行到系统剪贴板" })

vim.keymap.set("n", "<tab>", ":tabnext<Return>", { noremap = true, silent = true })
