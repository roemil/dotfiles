return {
  {
    'neovim/nvim-lspconfig',
  },
  {
    "hrsh7th/nvim-cmp", -- completion engine
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- completion source for LSP
      "L3MON4D3/LuaSnip",     -- snippet engine (required by cmp)
    },
    config = function()
      require("config.cmp") -- your completion config
      require("config.lsp")
    end,
  },
}
