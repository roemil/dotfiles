-- Capabilities for code completion
local capabilities = require("cmp_nvim_lsp").default_capabilities()



local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }

vim.api.nvim_create_user_command("ClangdSwitchSourceHeader", function()
  local params = { uri = vim.uri_from_bufnr(0) }
  vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(err, result)
    if err then
      vim.notify("Error switching source/header: " .. err.message, vim.log.levels.ERROR)
      return
    end
    if not result then
      vim.notify("No corresponding file found", vim.log.levels.WARN)
      return
    end
    vim.cmd("edit " .. vim.uri_to_fname(result))
  end)
end, { desc = "Switch between source/header using clangd" })


  -- Define keymaps
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gh", "<cmd>ClangdSwitchSourceHeader<cr>", opts)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

vim.lsp.config("clangd", {
  cmd = { "/opt/clangd_19.1.2/bin/clangd",
          "--fallback-style=Google"
        },
  root_dir = vim.fs.dirname(
  vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]
),

  capabilities = capabilities,
  on_attach = on_attach,
})
vim.lsp.enable("clangd")

vim.diagnostic.config({
  virtual_text = true,  -- <- shows warning/error next to code
  signs = true,         -- <- shows symbols in the sign column
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

