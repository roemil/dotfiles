return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
    config = function()
      require("fzf-lua").setup({
        files = {
            -- Use ripgrep as the file provider
            cmd = "rg --files --hidden --glob '!.git/*'",
        },
        grep = {
            -- Use ripgrep for text search
            rg_opts = "--hidden --glob '!.git/*' --column --line-number --no-heading --color=always --smart-case",
          },
     })
    end,
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Find Buffers" },
      { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help Tags" },
    }
  }
}

