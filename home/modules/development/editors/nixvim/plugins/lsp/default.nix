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
    virtual_text = {
      spacing = 4;
      prefix = "●";
    };
    float = {
      border = "rounded";
    };
  };
}
