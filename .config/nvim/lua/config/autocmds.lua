-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
--   callback = function()
--     vim.lsp.buf.code_action({
--       apply = true,
--       context = {
--         only = { "source.fixAll.eslint" },
--         diagnostics = { "Eslint fix applied ✔", vim.log.levels.INFO },
--       },
--     })
--   end,
-- })
-- Biến toàn cục để lưu trạng thái bộ gõ (1: English, 2: Vietnamese)
local last_fcitx_status = 1

local fcitx_group = vim.api.nvim_create_augroup("FcitxAutoSwitch", { clear = true })

-- Khi thoát Insert Mode: Lưu trạng thái và chuyển sang English
vim.api.nvim_create_autocmd("InsertLeave", {
  group = fcitx_group,
  pattern = "*",
  callback = function()
    -- Lấy trạng thái hiện tại (fcitx5-remote trả về 1 hoặc 2)
    local status = tonumber(vim.fn.system("fcitx5-remote"))
    if status then
      last_fcitx_status = status
    end
    -- Luôn chuyển về English khi ra Normal Mode
    vim.fn.system("fcitx5-remote -c")
  end,
})

-- Khi vào Insert Mode: Khôi phục trạng thái cũ
vim.api.nvim_create_autocmd("InsertEnter", {
  group = fcitx_group,
  pattern = "*",
  callback = function()
    -- Nếu trạng thái lưu trước đó là 2 (Tiếng Việt), thì bật lại
    if last_fcitx_status == 2 then
      vim.fn.system("fcitx5-remote -o")
    end
  end,
})
