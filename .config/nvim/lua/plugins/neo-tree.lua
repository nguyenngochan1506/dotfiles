return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,          -- Luôn hiển thị các mục bị lọc (bao gồm file ẩn)
        hide_dotfiles = false,   -- Không ẩn file dấu chấm
        hide_gitignored = false, -- Hiện luôn cả file trong .gitignore (rất tiện khi code)
        hide_hidden = false,     -- Không ẩn file hệ thống
      },
    },
  },
}
