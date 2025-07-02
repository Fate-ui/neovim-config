-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- HTML标签间Enter键自动换行
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "vue", "jsx", "tsx" },
  callback = function()
    vim.keymap.set("i", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local before = line:sub(1, col)
      local after = line:sub(col + 1)
      
      -- 检查是否在匹配的HTML标签之间
      local before_tag = before:match(".*<([%w%-_]+)[^>]*>%s*$")
      local after_tag = after:match("^%s*</([%w%-_]+)>")
      
      if before_tag and after_tag and before_tag == after_tag then
        return "<CR><CR><Up><Tab>"
      else
        return "<CR>"
      end
    end, { buffer = true, expr = true })
    
    -- 修复HTML标签删除问题 - 使用treesitter文本对象
    vim.keymap.set("n", "dat", "vatt<Esc>d", { buffer = true, desc = "Delete around tag" })
    vim.keymap.set("n", "dit", "vitt<Esc>d", { buffer = true, desc = "Delete inside tag" })
    vim.keymap.set("n", "cat", "vatt<Esc>c", { buffer = true, desc = "Change around tag" })
    vim.keymap.set("n", "cit", "vitt<Esc>c", { buffer = true, desc = "Change inside tag" })
    vim.keymap.set("n", "vit", "vitt<Esc>", { buffer = true, desc = "Select inside tag" })
    vim.keymap.set("n", "vat", "vatt<Esc>", { buffer = true, desc = "Select around tag" })
  end,
})
