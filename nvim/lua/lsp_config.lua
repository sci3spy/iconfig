local lsp_installer = require "nvim-lsp-installer"

lsp_installer.settings {
  ui = {
    icons = {
      server_installed = "",
      server_pending = "",
      server_uninstalled = "",
    },
  },
}

-- Sign column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(client)
  local bufnr = { buffer = true }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufnr)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufnr)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufnr)
  vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufnr)
  vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufnr)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufnr)
  vim.keymap.set("n", "<leader>fr", vim.lsp.buf.formatting, bufnr)
  
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

return lsp_installer.on_server_ready(function(server)
  local default_opts = { on_attach = on_attach, capabilities = capabilities }

  server:setup(default_opts)
end)
