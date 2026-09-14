{ ... }:

{
  imports = [
    ./keymaps.nix
  ];

  plugins.lsp = {
    enable = true;
    inlayHints = true;
  };

  diagnostic.settings = {
    underline = true;
    update_in_insert = false;
    severity_sort = true;
    signs = {
      text = {
        "__rawKey__vim.diagnostic.severity.ERROR" = " ";
        "__rawKey__vim.diagnostic.severity.WARN" = " ";
        "__rawKey__vim.diagnostic.severity.INFO" = " ";
        "__rawKey__vim.diagnostic.severity.HINT" = " ";
      };
    };
    virtual_text = {
      spacing = 4;
      prefix = "●";
    };
    float = {
      border = "rounded";
    };
  };
}
