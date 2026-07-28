return {
  -- Disable Mason plugins so Neovim uses language servers and tools installed via Nix
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
}
