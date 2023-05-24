local M = {}

function M.setup()
   require("plugins.leap").setup()
   require("plugins.indent-blankline").setup()
   require("plugins.catppuccin").setup()
   require("plugins.colorizer").setup()
   require("plugins.treesitter")
   require("plugins.feline").setup()
   require("plugins.tint")
   require("plugins.twilight")
   require("plugins.autopairs").setup()
   require("plugins.telescope")
   require("plugins.dressing").setup()
   require("plugins.lspconfig").setup()
   require("plugins.ufo")
   require("plugins.dap").setup()
   require("plugins.which-key")
   require("plugins.gitsigns").setup()
   require("plugins.luasnip").setup()
   require("plugins.todo-comments")
   require("plugins.markdown-preview").setup()
   require("plugins.vimtex")
   require("plugins.cmp").setup()
   require("plugins.neoclip").setup()
   require("plugins.zk")
end

return M
