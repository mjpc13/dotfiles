return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    --Highlights TODOs
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
  },
  {
    --Not working I think
    "thibthib18/ros-nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    --To leap between keywords
    "ggandor/leap.nvim",
    opts = {},
    event = "User AstroFile",
  }
}
