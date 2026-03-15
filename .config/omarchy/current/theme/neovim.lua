return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- Load ngay lập tức khi mở Neovim
    priority = 1000, -- Đảm bảo nó được load trước các plugin khác
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- Cho phép nghịch đảo màu (rất hợp với style animation con trỏ của bạn)
        contrast = "hard", -- Chọn "hard" để có nền đen sâu và màu vàng rực rỡ hơn
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox", -- Ép LazyVim sử dụng gruvbox làm mặc định
    },
  },
}
