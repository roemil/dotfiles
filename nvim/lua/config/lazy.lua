-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


vim.opt.history = 500
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
--vim.opt.signcolumn = "number"
vim.opt.number = true
vim.opt.scrolloff = 4
vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 1
-- vim.opt.hidden = true
vim.opt.showmatch = true
vim.opt.swapfile = false

-- search and replace
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.linebreak = true
vim.opt.shiftwidth = 4    -- indentation size when using >> or <<
vim.opt.softtabstop = 4   -- how many spaces a <Tab> inserts in insert mode
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.colorcolumn = "120"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

local actions = require("fzf-lua").actions
actions = {
    -- Below are the default actions, setting any value in these tables will override
    -- the defaults, to inherit from the defaults change [1] from `false` to `true`
    files = {
      true,        -- uncomment to inherit all the below in your custom config
      -- Pickers inheriting these actions:
      --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
      --   tags, btags, args, buffers, tabs, lines, blines
      -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
      -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
      -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
      -- ["enter"]       = actions.file_edit_or_qf,
      -- ["ctrl-s"]      = actions.file_split,
      -- ["ctrl-v"]      = actions.file_vsplit,
      -- ["ctrl-t"]      = actions.file_tabedit,
      -- ["alt-q"]       = actions.file_sel_to_qf,
      -- ["alt-Q"]       = actions.file_sel_to_ll,
      -- ["alt-i"]       = actions.toggle_ignore,
      -- ["alt-h"]       = actions.toggle_hidden,
      -- ["alt-f"]       = actions.toggle_follow,
    },
  }
