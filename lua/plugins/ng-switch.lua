return {
  "grantwforsythe/ng-switch.nvim",
  -- defaults
  opts = {
      is_vsplit = false, -- Set to true to open files in a vertical split
      style_formats = { "scss", "css", "sass", "less" }, -- Order of style extensions to check
  },
  keys = {
    { "<leader>1", "<cmd>NgSwitchTS<CR>", desc = "Switch to TypeScript file" },
    { "<leader>2", "<cmd>NgSwitchHTML<CR>", desc = "Switch to HTML file" },
    { "<leader>3", "<cmd>NgSwitchCSS<CR>", desc = "Switch to Style file" },
    { "<leader>4", "<cmd>NgSwitchSpec<CR>", desc = "Switch to Spec file" },
  }
}
